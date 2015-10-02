class WelcomeController < ApplicationController

  def index
    @users = User.all
    @plants = Plants.all

  end

  def about

  end

end
