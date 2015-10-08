class Api::PostsController < ApplicationController
include Api::PostsHelper

  before_action :current_api_user!

  def index
    render json: @current_user.posts
  end

  def show
    render json: @current_user.posts.find(params[:id])
  end

  def create
    render json: @current_user.posts.create(post_params)
  end

  def destroy
    @current_user.posts.destroy(params[:id])
    render json: {status: 202, message: 'success'}
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
