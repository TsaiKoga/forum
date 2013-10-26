# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
	before_filter :find_user, :only => [:show, :topics, :favorites, :notes]

	def index
		@total_user_count = User.count
	end

	def show
	end

	def topics
		@topics = @user.topics.paginate(page: params[:page], per_page: 15)
	end

	def favorites
		favorite_topic_ids = current_user.favorite_topic_ids.nil? ? [] : current_user.favorite_topic_ids.split(",")
		@favorites = Topic.find_by_ids(favorite_topic_ids)
	end

	def notes
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy unless @user.admin?
		flash[:success] = "成功删除用户。"
		redirect_to member_path
	end

	protected
		def find_user
			@user = User.where(:name => params[:id]).first
		end
end
