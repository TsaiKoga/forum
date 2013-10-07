# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready -> 
# 向上滚动
	$("a.go_top").click () -> 
		$('html, body').animate({scrollTop: 0}, 300)
		return false

	$(window).bind 'scroll resize', -> 
		scroll_from_top = $(window).scrollTop()
		if scroll_from_top >= 1
			$('a.go_top').show()
		else
			$('a.go_top').hide()

