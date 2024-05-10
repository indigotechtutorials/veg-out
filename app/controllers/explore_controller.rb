class ExploreController < ApplicationController
  def index
    @explore_users = current_user.nearbys(30)
  end

  def set_location
    current_user.update(location_params)
    head :ok
  end

  private

  def location_params
    params.permit(:latitude, :longitude)
  end
end
