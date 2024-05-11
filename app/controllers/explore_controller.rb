class ExploreController < ApplicationController
  def index
    current_user.update(last_active: Time.zone.now)
    @explore_users = current_user.nearbys(30).order(last_active: :desc) if current_user.location_set?
  end

  def set_location
    current_user.update(location_params)
    head :ok
  end

  def change_distance

  end

  private

  def location_params
    params.permit(:latitude, :longitude)
  end
end
