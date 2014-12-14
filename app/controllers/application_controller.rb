class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  expose(:search_query) { params[:search] }

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname << :age
  end
end
