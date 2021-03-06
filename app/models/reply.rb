# -*- encoding : utf-8 -*-
class Reply < ActiveRecord::Base
	has_many :notifications, class_name: "Notification::Base", dependent: :destroy, as: :target

	belongs_to :user
	belongs_to :topic

  default_scope -> { order('created_at ASC') }

	validates :content, presence: true, length: {maximum: 250}
	validates_presence_of :user_id, :topic_id

	# 通知文章作者(带参数的回调)
	after_create do
		self.send_topic_reply_notification(self.id)
		self.inc_topic_replies_count
	end

	after_destroy :des_topic_replies_count

	# 创建通知
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

	def liked_by_user?(user)
		return false if user.blank?
		user_id = user.id
		liked_user_ids = self.liked_user_ids.blank? ? [] : self.liked_user_ids.split(",")
		return true if liked_user_ids.include?(user_id.to_s)
		false
	end

	def inc_topic_replies_count
		replies_count = self.topic.replies_count + 1
		self.topic.update_attributes!(replies_count: replies_count)
	end

	def des_topic_replies_count
		replies_count = self.topic.replies_count - 1
		self.topic.update_attributes!(replies_count: replies_count)
	end

	self.per_page = 15
end
