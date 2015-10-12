class PlantsController < ApplicationController
  include SessionsHelper

  def index
    @plants = Plant.all.sort
    @user = current_user
  end

  def show
    @user = current_user
    @plant = Plant.find(params[:id])
  end

  def about
    @user = current_user
  end

end
