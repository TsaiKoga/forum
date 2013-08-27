# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
	def home
		@high_likes_topics = Post.find_high_likes_topics
		@high_replies_topics = Post.find_high_replies_topics
	end

	def community
		@topics = Post.paginate(page: params[:page], per_page: 15)
  end

  def cool_site
  end

  def member
  end

	def about
	end

	def index
		@user = (params[:name] == current_user.name ? current_user : User.find_by_name(params[:user]))
	end

	def topics
	end

	def favorites
	end

	def notes
	end

end
