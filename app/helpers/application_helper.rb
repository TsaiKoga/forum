# -*- encoding : utf-8 -*-
module ApplicationHelper
	def markdown(text)
		require 'redcarpet'
		render = HTMLwithPygments
		options = {
			autolink: true,							# 自动加上link
			filter_html: true,					# 
			prettify: true,
			fenced_code_blocks: true,		# 代码块显示
		  no_intra_emphasis: true, 
		  gh_blockcode: true
		}
		markdown = Redcarpet::Markdown.new(render.new(hard_wrap: true), options)
		text = disposal_floor_and_at(text)
		markdown.render(text).html_safe
	end

	# 处理回复信息，将有@和#的添加链接
	def disposal_floor_and_at(text)
		floor_text = text.gsub(/(#\d+楼)/) do |s|
			floor = s.gsub(/#/, "").gsub(/楼/, "").to_i
			"<a href=\"#reply#{floor}\" class='at_floor' data-floor=\"#{floor}\">##{floor}楼</a>"
		end

		floor_text.gsub(/(@\S+)/) do |s| 
			at_who = s.gsub(/@/, "")
			"<a href=\"/#{at_who}\" class='at_who' title=\"#{at_who}\"><i>@</i>#{at_who}</a>"
		end
	end

	class HTMLwithPygments < Redcarpet::Render::HTML
		require 'pygments'
		def block_code(code, language)
			Pygments.highlight(code, :lexer => language, :options => {:linenos => true})
		end
	end

end

