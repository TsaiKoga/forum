# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

	has_many :topics, dependent: :destroy
	has_many :replies
	has_many :notifications, class_name: "Notification::TopicReply", dependent: :destroy
	

	validates :name, uniqueness: {case_sensitive: false}
	validates :signature, length: {maximum:  25}
	validates :introduction, length: {maximum: 500}

	attr_accessor :login

	has_attached_file :avatar, 
		:default_url => "/images/:attachment/missing/:style/missing.png",
		:path => ":rails_root/public/images/:attachment/:id/:style.:extension",			# 存储路径
		:url => "/images/:attachment/:id/:style.:extension",												# 读取路径
		:styles => {:small => "16X16", :normal => "48X48", :large => "64X64", :big => "120X120"}

	scope :old, order("created_at")

	# 覆盖find_for_database_authentication方法
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		else
			where(conditions).first
		end
	end

	def created_date
		created_at.strftime("%Y年%m月%d日")
	end

	# 所有这个用户并“未读”的提醒更新为“已读”
	def read_notifications(notifications)
		unread_ids = notifications.find_all{ |notification| !notification.read? }.map(&:id)	# 收集所有“未读”的提醒的id
		if unread_ids.any?
			Notification::Base.where({
				user_id: id,
				id:      unread_ids,																													# 设置id范围在数组unread_ids内
				read:    false
			}).update_all(read: true, updated_at: Time.now)
		end
	end

	# 收藏帖子
	def favorite_topic(topic_id)
		return false if topic_id.blank?
		topic_id = topic_id.to_s
		favorite_topic_ids = self.favorite_topic_ids.nil? ? [] : self.favorite_topic_ids.split(",")
		return false if favorite_topic_ids.include?(topic_id)
		favorite_topic_ids.push(topic_id)
		self.update_attributes!(favorite_topic_ids: favorite_topic_ids.join(","))
		true
	end

	# 取消收藏帖子
	def unfavorite_topic(topic_id)
		return false if topic_id.blank?
		favorite_topic_ids = self.favorite_topic_ids.nil? ? [] : self.favorite_topic_ids.split(",")
		favorite_topic_ids.delete(topic_id)
		self.update_attributes!(favorite_topic_ids: favorite_topic_ids.join(","))
	end
end
