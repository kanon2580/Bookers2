class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	end

	def after_sign_in_path_for(resource)
		user_path(current_user)
	end

end

Refile.secret_key = '62bc78e8ed61cdc9c597ce93032396558908de5f13cc8668e6fed56f5143ec38d25f8c2da7f244bc32eb26f46d49a561954337d67f4388c8f081fd2cfde1e1b0'