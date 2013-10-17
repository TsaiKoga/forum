# -*- encoding : utf-8 -*-
class Notification::TopicReply < Notification::Base
	belongs_to :reply, polymorphic: true

	def notify_hash
		return "" if self.reply.blank?
		{
			title: "您有新评论:",
			content: self.content[0, 30],
			content_path: self.content_path
		}
	end

	# 返回被评论的文章的路径
	def content_path
		return "" if self.reply.blank?
		url_helpers.topic_path(self.reply.topic_id)
	end

end
