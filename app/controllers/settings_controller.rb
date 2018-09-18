class SettingsController < ApplicationController
  def show
    @user = User.new
    @user = current_user
  end
end
