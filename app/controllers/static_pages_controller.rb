class StaticPagesController < ApplicationController
	def home
		@high_likes_topics = Post.find_high_likes_topics
		@high_replies_topics = Post.find_high_replies_topics
	end

  def community
  end

  def cool_site
  end

  def member
  end

	def about
	end
end
