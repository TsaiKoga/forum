#= require jquery
#= require jquery_ujs
#= require bootstrap-transition
#= require bootstrap-alert
#= require bootstrap-modal
#= require bootstrap-dropdown
#= require bootstrap-tab
#= require bootstrap-tooltip
#= require bootstrap-button
#= require turbolinks
#= require topics
#= require_self

window.App = 

	# 喜欢帖子
	likeable: (el) ->
		like_num = $(el).data('count')
		likeable_id = $(el).data('id')
		likeable_type = $(el).data('type')
		if $(el).data("state") != 'liked'
			$.ajax
				url: '/likes'
				type: "POST"
				data:
					type: likeable_type
					id: likeable_id

			like_num += 1
			$(el).data('count', like_num)
			App.likeableAsLiked(el)
		else
			$.ajax
				url: "/likes/#{likeable_id}"
				type: "DELETE"
				data:
					type: likeable_type
			if like_num > 0
				like_num -= 1
			$(el).data("state", "").data("count", like_num).attr("title", "喜欢")
			if like_num == 0
				$('span', el).text("喜欢")
			else
				$('span', el).text("有#{like_num}人喜欢")
			$("i.icon", el).attr("class", "icon small_like")
		false

	# 将喜欢变成已喜欢
	likeableAsLiked: (el) ->
		like_num = $(el).data("count")
		$(el).data("state", "liked").attr("title", "取消喜欢")
		$('span', el).text("有#{like_num}人喜欢")
		$("i.icon", el).attr("class", "icon small_liked")

