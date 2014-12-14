class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  before_action :authorize_user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  expose(:search_query) { params[:search] }

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname << :age
  end

  def authorize_user
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
