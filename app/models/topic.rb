class Topic < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	validates_presence_of :user_id, :content
	validates :title, presence: true, length: {maximum: 30}
  default_scope -> { order('created_at DESC') }

	scope :find_high_likes_topics, order("like_num DESC").take(10)
	scope :find_high_replies_topics, order("read_num DESC").take(10)

	def replie_num
		comments.count
	end

	def created_ago
		created_at
	end

end
