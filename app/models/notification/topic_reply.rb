# -*- encoding : utf-8 -*-
class Notification::TopicReply < Notification::Base
	belongs_to :target, polymorphic: true

	def content_path
		return "" if self.target.blank?
		# app.topic_path(self.target.topic_id)						# Rails 4
		Rails.application.routes.url_helpers.topic_path(self.target.topic_id)
	end
	
	def notify_hash
		return "" if self.target.blank?
		{
			title: "您有新的评论：",
			content: self.target.content[0, 30],
			content_path: self.content_path
		}
	end

end
