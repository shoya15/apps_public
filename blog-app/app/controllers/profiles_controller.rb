class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_profile, only: [:show, :edit, :update]
    before_action :force_redirect_unless_my_post, only: [:edit, :update]

    def show
        @post = Post.find(params[:id])
    end

    def new
        redirect_to edit_profile_path(current_user.profile) if current_user.profile.present?
        @profile = Profile.new
    end

    def edit
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        if @profile.save
            redirect_to root_path, notice: "プロフィールの登録が完了しました"
        else
            render :new
        end
    end

    def update
        if @profile.update(profile_params)
            redirect_to root_path, notice: "プロフィールの更新が完了しました"
        else
            render :edit
        end
    end

    private

    def profile_params
        params.required(:profile).permit(:name, :purpose, :image)
    end

    def find_profile
        @profile = Post.find(params[:id])
    end

    def force_redirect_unless_my_profile
        redirect_to root_path, alert:"自分のプロフィールではありません" if @profile.user != current_user
    end
end
