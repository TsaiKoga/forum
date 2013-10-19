module NotificationsHelper
	def his_notifications
		current_user.notifications
	end
end
