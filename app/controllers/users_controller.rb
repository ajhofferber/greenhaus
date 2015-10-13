class UsersController < ApplicationController
  include SessionsHelper

  def index
  end

  def login
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to '/'
  end

  def profile
    authenticate!
    @user = current_user
    @greeneries = Greenery.where("user_id = ?", @current_user.id)
  end

  def edit
    authenticate!
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to '/users/profile'
  end

  def destroy
    user = User.find(params[:id])
    user.delete()
    redirect_to '/'
  end


  private
    def user_params
      params.require(:user).permit(:username, :password, :email, :pic_url, :phone, :text_reminder, :token)
    end


end
