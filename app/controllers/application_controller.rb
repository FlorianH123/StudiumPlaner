class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    cookies[:locale] = params.permit(:locale)[:locale] if params.permit(:locale)[:locale].present?
    I18n.locale = cookies[:locale]
  end # #set_locale
end
