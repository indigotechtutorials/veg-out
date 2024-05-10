class SettingsController < ApplicationController
  def show; end

  def create
    current_user.update(user_params)
    redirect_to settings_path, notice: "Your profile successfully updated!"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :about_me)
  end
end