class Topic < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	validates_presence_of :user_id, :content
	validates :title, presence: true, length: {maximum: 100}
  default_scope -> { order('created_at DESC') }

	scope :find_high_likes_topics, order("like_num DESC")
	scope :find_high_replies_topics, order("read_num DESC")

	def replie_num
		comments.count
	end

	def created_ago
		created_at
	end

	def updated_ago
		updated_at
	end

	def replies_and_loves
		"#{comments.count}/#{like_num}"
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

end
