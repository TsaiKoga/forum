class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

  default_scope -> { order('created_at ASC') }
	
	validates :content, presence: true, length: {maximum: 100}
	validates_presence_of :user_id, :post_id
end
