class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :image])
  end

  def set_locale
    cookies[:locale] = params.permit(:locale)[:locale] if params.permit(:locale)[:locale].present?
    I18n.locale = cookies[:locale]
  end # #set_locale


end
