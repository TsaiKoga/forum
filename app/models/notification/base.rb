# -*- encoding : utf-8 -*-
class Notification::Base < ActiveRecord::Base
	belongs_to :user, polymorphic: true

	scope :unread, where(read: false)
	after_create :send_to_author

	def send_to_author
		if self.user
			hash = self.notify_hash
			hash[:count] = self.user.notifications.unread.count

		end
	end

	def content_path
		""
	end
end
