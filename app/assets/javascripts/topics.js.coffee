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

