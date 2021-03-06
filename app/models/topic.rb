# -*- encoding : utf-8 -*-
class Topic < ActiveRecord::Base
	has_many :replies, dependent: :destroy
	belongs_to :user
	belongs_to :node

	validates_presence_of :user_id, :content
	validates :title, presence: true, length: {maximum: 100}
  default_scope -> { order('created_at DESC') }

	scope :find_high_likes_topics, order("like_num DESC")
	scope :find_high_replies_topics, order("replies_count DESC")
	scope :popular, -> { where("like_num > ?", 5) }
	scope :last_created, -> { order('created_at DESC') }		# TODO


	def created_ago
		created_at
	end

	def updated_ago
		updated_at
	end

	def date_time
		created_at.strftime("%Y年%m月%d日,%H:%M")
	end

	def replies_and_loves
		"#{replies.count}/#{like_num}"
	end

	def increase_read_num
		self.read_num += 1
		self.save!
	end

	# 假删除
	def destroy_by(user)
		false if user.nil?
		return false if user.blank?
    self.update_attribute(:who_deleted,user.name)
    self.destroy
	end

	def destroy
    super
    # delete_notifiaction_mentions
  end

	def self.find_by_ids(ids)
		topics = ids.collect do |_id|
			self.find(_id.to_i)
		end
		topics
	end

	def liked_by_user?(user)
		return false if user.blank?
		user_id = user.id
		liked_user_ids = self.liked_user_ids.blank? ? [] : self.liked_user_ids.split(",")
		return true if liked_user_ids.include?(user_id.to_s)
		false
	end

end
