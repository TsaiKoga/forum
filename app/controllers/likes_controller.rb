# -*- encoding : utf-8 -*-
class LikesController < ApplicationController
	before_filter :find_likeable

	def create
		current_user.like(@item)
		render text: @item.like_num
	end

	def destroy
		current_user.unlike(@item)
		render text: @item.like_num
	end

	private
		def find_likeable
			if not params[:type].in?(["Topic", "Reply"])
				render text: -1
				return false
			end

			klass = params[:type].downcase.camelize

			@item = klass.constantize.find_by_id(params[:id])

			if @item.blank?
				render text: "-2"
				return false
			end
		end
end
