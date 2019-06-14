class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_locale

private
def set_locale
	I18n.locale = params[:locale] || I18n.default_locale
end

def default_url_options(options = {})
	{ locale: I18n.locale }.merge options
end


  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :avatar, :about, :email, :password, :current_password, :remember_me])
  end
	
end
