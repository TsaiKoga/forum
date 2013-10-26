# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Topics = 

	# 点击预览功能
	preview: (body) ->
		$("#preview").text "Loading..."

		$.post "/topics/preview",
			"body": body,										  # 传入后台的参数：params[:body]
			(result) ->												# data接住返回值json
        $("#preview").html result.body
			"json"

	# 点击回复此楼功能
	reply: (floor, login) ->
		reply_body = $("#reply_body")
		new_text = "##{floor}楼 @#{login}"
		if reply_body.val().trim().length == 0
			new_text += ''
		else
			new_text = "\n#{new_text}"
		reply_body.focus().val(reply_body.val() + new_text)
		return false

	# 收藏帖子
	favorite: (el) ->
		topic_id = $(el).data("id")
		if $(el).hasClass("small_bookmarked")
			hash = {type: "unfavorite"}
			$.ajax
				url: "/topics/#{topic_id}/favorite"
				data: hash
				type: "POST"
			$(el).attr("title", "收藏")
			$(el).attr("class", "icon small_bookmark")
		else
			$.post "/topics/#{topic_id}/favorite"
			$(el).attr("title", "取消收藏")
			$(el).attr("class", "icon small_bookmarked")
		false

$(document).ready ->
	$(".edit a").click ->
		$(this).parent().addClass("active")
		$(".preview a").parent().removeClass("active")
		$("#reply_body").show()
		$("#preview").hide()
		false

	$(".preview a").click ->
		$(this).parent().addClass("active")
		$(".edit a").parent().removeClass("active")
		Topics.preview($("#reply_body").val())
		$("#preview").show()
		$("#reply_body").hide()
		false

	$("a.small_reply").click ->
		Topics.reply($(this).data("floor"), $(this).attr("data-login"))

