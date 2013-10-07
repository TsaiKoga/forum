# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 点击预览功能
window.Topics = 
	preview: (body) ->
		$("#preview").text "Loading..."

		$.post "/topics/preview",
			"body": body,										  # 传入后台的参数：params[:body]
			(result) ->												# data接住返回值json
        $("#preview").html result.body
			"json"

$(document).ready ->
	$(".edit a").click ->
		$(this).parent().addClass("active")
		$(".preview a").parent().removeClass("active")
		$("#topic_content").show()
		$("#preview").hide()
		false

	$(".preview a").click ->
		$(this).parent().addClass("active")
		$(".edit a").parent().removeClass("active")
		Topics.preview($("#topic_content").val())
		$("#preview").show()
		$("#topic_content").hide()
		false

