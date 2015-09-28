class WelcomeController < ApplicationController

  def index
    @users = User.all
    @posts = Post.all
  end

  def about

  end

end
