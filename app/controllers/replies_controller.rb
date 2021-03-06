# -*- encoding : utf-8 -*-
class RepliesController < ApplicationController
	before_filter :find_topic

	def create
		@reply = Reply.new(reply_params)
		@reply.topic_id = @topic.id
		@reply.user_id = current_user.id
		# @reply.disposal_floor_and_at
		if @reply.save
			flash[:success] = "成功回复！"
			respond_to do |format|
				format.js
			end
		else
			flash[:failure] = "回复失败！"
		end
	end

	def edit
		@reply = Reply.find(params[:id])
	end

	def update
		@reply = Reply.find(params[:id])

		if @reply.update_attributes(reply_params)
			flash[:success] = "编辑成功！"
			redirect_to(topic_path(@topic))
		else
			flash[:success] = "编辑失败！"
		end
	end

	def destroy
		@reply = Reply.find(params[:id])

		if @reply.destroy
			flash[:success] = "删除成功！"
			redirect_to(topic_path(@topic))
		else
			flash[:success] = "删除失败！"
			redirect_to(topic_path(@topic))
		end
	end

	protected
		def find_topic
			@topic = Topic.find(params[:topic_id])
		end

		def reply_params
			params.require(:reply).permit(:content)
		end
end
