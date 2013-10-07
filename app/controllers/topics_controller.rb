# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
	def index
		@users_count = User.count
		@topics = Topic.paginate(page: params[:page], per_page: 15)
  end

	def show
		@topic = Topic.find(params[:id])
		@topic.increase_read_num
	end

	def new
		@topic = Topic.new
		unless params[:node].blank?
			@topic.node_id = params[:node]
			@node = Node.find_by_id(params[:node])
		end
	end

	def create
		pt = params[:topic].permit(:title, :content, :node_id)
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

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		pt = params[:topic].permit(:title, :content)
		@topic.title = pt[:title]
		@topic.content = pt[:content]

		if @topic.save then
			flash[:success] = "成功修改帖子!"
			redirect_to topic_path(@topic.id)
		else
			flash[:failure] = "帖子修改失败，请重新操作。"
			render action: 'edit'
		end
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy_by(current_user)			# 删除，并记录删除人。
		flash[:success] = "成功删除帖子。"
		redirect_to topics_path
	end

	# 点击产生预览
	def preview
		@body = params[:body]

		respond_to do |format|
			format.json
		end
	end

end
