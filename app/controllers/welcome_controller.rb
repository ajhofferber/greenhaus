class WelcomeController < ApplicationController
include SessionsHelper

  def index
    @user = current_user
    @plants = Plant.all.sort
  end



end
