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
	end

	def notes
	end

	protected
		def find_user
			@user = User.where(:name => params[:id]).first
			render_404 if @user.nil?
		end
end
