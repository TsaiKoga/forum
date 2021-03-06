# -*- encoding : utf-8 -*-
module LikesHelper
	def likeable_tag(likeable, opts = {})
		return "" if likeable.blank?

		likeable.like_num.to_i == 0 ? label = "喜欢" : label = "有#{likeable.like_num.to_i}人喜欢"

		if current_user and likeable.liked_by_user?(current_user)
			title = "取消喜欢"
			state = "liked"
			icon = content_tag("i", "", :class => "icon small_liked")
		else
			title = "喜欢"
			state = ""
			icon = content_tag("i", "", :class => "icon small_like")
		end

    like_label = raw "#{icon} <span>#{label}</span>"
    link_to(like_label, "#", :title => title, 'data-count' => likeable.like_num.to_i,
            'data-type' => likeable.class, 'data-id' => likeable.id,
            :class => 'likeable', :onclick => "return App.likeable(this);")
						
	end
end
