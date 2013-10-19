# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	notifications_count = $("a.notifications-count .badge").text()
	if notifications_count > 0
		$("a.notifications-count .badge").fadeTo("slow", 0.5).fadeTo("slow", 1.0)
	return false

