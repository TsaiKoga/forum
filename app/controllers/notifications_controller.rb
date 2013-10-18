# -*- encoding : utf-8 -*-
class NotificationsController < ApplicationController
	def index
		@notifications = current_user.notifications.paginate(page: params[:page], per_page: 15)
		current_user.read_notifications(@notifications)
	end
end
