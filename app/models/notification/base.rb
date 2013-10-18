# -*- encoding : utf-8 -*-
class Notification::Base < ActiveRecord::Base
	belongs_to :user

	scope :unread, where(read: false)
	after_create :send_to_author

	def send_to_author
		if self.user
			hash = self.notify_hash
			hash[:count] = self.user.notifications.unread.count

		end
	end

	def read_situation
		if self.read then
			"已读提醒："
		else
			"未读提醒："
		end
	end

	def notify_background
		self.read ? "" : "background-color: #dee;"
	end

	def anchor
		"notification-#{id}"
	end
end
