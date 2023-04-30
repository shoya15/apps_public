class WelcomeController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(10).order(created_at: :desc)
  end
end