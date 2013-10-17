# -*- encoding : utf-8 -*-
class Reply < ActiveRecord::Base
	has_many :notifications, class_name: "Notification::Base", dependent: :destroy, as: :target

	belongs_to :user
	belongs_to :topic

  default_scope -> { order('created_at ASC') }

	validates :content, presence: true, length: {maximum: 150}
	validates_presence_of :user_id, :topic_id

	# 通知文章作者(带参数的回调)
	after_create do
		self.send_topic_reply_notification(self.id)
	end

	def send_topic_reply_notification(reply_id)
		reply = Reply.find_by_id(reply_id)
		return if reply.blank?
		topic = Topic.find_by_id(reply.topic_id)
		return if topic.blank?

		# 如果通知了发帖人或发帖人是回复人，则不创建新通知，创建通知信息：
		notified_user_ids = []
		if reply.user_id != topic.user_id && !notified_user_ids.include?(topic.user_id)
			Notification::TopicReply.create user_id: topic.user_id, target_id: reply.id, target_type: "Reply"
			notified_user_ids << topic.user_id
		end

		true
	end
end
