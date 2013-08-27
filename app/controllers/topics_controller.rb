# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
	def index
		@topics = Topic.paginate(page: params[:page], per_page: 15)
  end

	def show
		@topic = Topic.find(params[:id])
	end
end
