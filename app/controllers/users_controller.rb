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

  private
    def user_params
      params.require(:user).permit(:username, :password, :email, :token)
    end


end
