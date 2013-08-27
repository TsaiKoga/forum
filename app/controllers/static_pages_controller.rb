# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
	def home
		@high_likes_topics = Topic.find_high_likes_topics
		@high_replies_topics = Topic.find_high_replies_topics
	end

  def cool_site
  end

  def member
  end

	def about
	end

	def index
		@user = (params[:name] == current_user.name ? current_user : User.find_by_name(params[:name]))
	end

	def topics
	end

	def favorites
	end

	def notes
	end

end
