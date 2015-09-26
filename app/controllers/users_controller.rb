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
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end


end
