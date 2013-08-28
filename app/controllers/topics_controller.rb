# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
	def index
		@topics = Topic.paginate(page: params[:page], per_page: 15)
  end

	def show
		@topic = Topic.find(params[:id])
		@topic.increase_read_num
	end

	def new
		@topic = Topic.new
	end

	def create
		pt = params[:topic].permit(:title, :content)
		@topic = Topic.new(pt)
		@topic.user_id = current_user.id
		if @topic.save then
			flash[:success] = "成功发布帖子!"
			redirect_to topic_path(@topic.id)
		else
			flash[:failure] = "帖子发布失败，请重新操作。"
			redirect_to new_topic_path
		end
	end

end
