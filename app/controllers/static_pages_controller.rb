# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
	def home
		@high_likes_topics = Topic.find_high_likes_topics.take(10)
		@high_replies_topics = Topic.find_high_replies_topics.take(10)
	end

  def cool_site
  end

  def member
		@users_count = User.count
		current_user.admin? ? @all_users = User.paginate(page: params[:page], per_page: 100) : @old_users = User.old.take(100)
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
