# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	# 给所有视图使用的方法
	helper_method :unread_notify_count

	# 用来给devise增加字段的，允许发送后台
	before_filter :configure_permitted_parameters, if: :devise_controller?

																									 
	def unread_notify_count
		return 0 if current_user.blank?
		@unread_notify_count ||= current_user.notifications.where(read: false).count
	end

  protected
	# 健壮参数:可以指定需要哪些请求参数，允许传入哪些请求参数。
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :remember) }
		devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:login, :name, :avatar, :current_password, :signature, :introduction)}
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :name, :email, :avatar, :password) }
  end

end
