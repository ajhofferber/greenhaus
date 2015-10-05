class WelcomeController < ApplicationController

  def index
    @users = User.all
    @plants = Plant.all

  end

  def about

  end

end
