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
		markdown.render(text).html_safe
	end

	class HTMLwithPygments < Redcarpet::Render::HTML
		require 'pygments'
		def block_code(code, language)
			Pygments.highlight(code, :lexer => language, :options => {:linenos => true})
		end
	end

end

