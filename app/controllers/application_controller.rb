class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  I18n.locale = :fr
  
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options(options = {})
	  { locale: I18n.locale }.merge options
	end

	def after_sign_in_path_for(resource)
	  home_path
	end

	def after_sign_out_path_for(resource_or_scope)
	  home_path
	end
	def require_admin
	flash[:error] = "Vous devez avoir des droits d'administrateurs pour accéder à ces fonctionnalités !" unless current_user.admin?
	redirect_to '/' unless current_user.admin?
	end

	protected

	def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_up) << :pseudo << :prenom_user << :nom_user
	end
  
end
