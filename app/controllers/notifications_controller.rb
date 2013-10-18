# -*- encoding : utf-8 -*-
class NotificationsController < ApplicationController
	def index
		@notifications = current_user.notifications.paginate(page: params[:page], per_page: 15)
		current_user.read_notifications(@notifications)
	end

	def destroy
		@notification = current_user.notifications.find params[:id]
		if @notification.destroy
			respond_to do |format|
				format.html { redirect_to notifications_path }
				format.js 
			end
		end
	end

	def clear
		@notification = current_user.notifications
		if @notification.delete_all
			respond_to do |format|
				format.html { redirect_to notifications_path }
				format.js
			end
		end
	end

end
