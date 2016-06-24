class GreeneriesController < ApplicationController
  include SessionsHelper

  def create
    @greeneries = Greenery.create(greenery_params)
    redirect_to '/users/profile'
  end

  def destroy
    greenery = Greenery.find(params[:id])
    greenery.delete()
    redirect_to '/users/profile'
  end

  private
  def greenery_params
    params.require(:greenery).permit(:user_id, :plant_id, :last_sent)
  end

end
