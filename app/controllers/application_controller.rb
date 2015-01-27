class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  include Authenticable

  rescue_from CanCan::AccessDenied do |exception|
    render json: { errors: exception.message }, status: 401
  end
end
