module NotificationsHelper
	def unread_notifications
		current_user.notifications.unread
	end

	def his_notifications
		current_user.notifications
	end
end
