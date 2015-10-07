class PlantsController < ApplicationController
  include SessionsHelper

  def index
    @plants = Plant.all
  end

  def show
    @user = current_user
    @plant = Plant.find(params[:id])
  end

end
