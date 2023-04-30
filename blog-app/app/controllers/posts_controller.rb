class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :force_redirect_unless_my_post, only: [:edit, :update, :destroy]

    def show
    end

    def new
        redirect_to new_profile_path, alert: "プロフィールを登録してください" unless current_user.profile.present?
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to root_path, notice: "設定しました"
        else
            render :new
        end
    end

    def update
        if @post.update(post_params)
            redirect_to root_path, notice: "更新しました"
        else
            render :edit
        end
    end

    def destroy
        if @post.destroy
            redirect_to root_path, notice: "削除しました"
        else
            redirect_to root_path, alert: "削除できませんでした"
        end
    end

    private

    def post_params
        params.require(:post).permit(:content, images: [])
    end

    def find_post
        @post = Post.find(params[:id])
    end

    def force_redirect_unless_my_post
       redirect_to root_path, alert:"自分の投稿ではありません" if @post.user != current_user
    end
end
