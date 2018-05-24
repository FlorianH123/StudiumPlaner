class LocalesController < ApplicationController
  def update
    I18n.locale = params.permit(:locale)[:locale]
    redirect_back(fallback_location: root_path)
  end # #update
end
