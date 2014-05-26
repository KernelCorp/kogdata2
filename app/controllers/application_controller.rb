class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password, :password_confirmation, :terms) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me, :login_or_email) }
    devise_parameter_sanitizer.for(:account_update) do |u| 
      u.permit(
        :login, :email, :password, :password_confirmation, :current_password, 
        :name, :surname, :location, :site, :vk, :fb, :tw, :gp, :avatar,
        { subscribe_attributes: [:responses, :messages, :events_in_town] },
        :price, { skills: [] }
      ) 
    end
  end
end
