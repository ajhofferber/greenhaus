class WelcomeController < ApplicationController

  def index
    @users = User.all
    @plants = Plant.all.sort

  end

  def about

  end

end
