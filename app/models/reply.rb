# -*- encoding : utf-8 -*-
class Reply < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic

  default_scope -> { order('created_at ASC') }

	validates :content, presence: true, length: {maximum: 150}
	validates_presence_of :user_id, :topic_id
end
