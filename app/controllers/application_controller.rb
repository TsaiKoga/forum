class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# 用来给devise增加字段的，允许发送后台
	# before_filter :update_sanitized_params, if: :devise_controller?
	# def update_sanitized_params
		# devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:dddd)}
	# end

	# 网上查的
	# after_filter :store_location

	# private
		# def store_location
			# session[:return_to] = request.fullpath
		# end

		# def clear_stored_location
			# session[:return_to] = nil
		# end

		# def redirect_back_or_to(alternate)
			# redirect_to(session[:return_to] || alternate)
			# clear_stored_location
		# end

end
