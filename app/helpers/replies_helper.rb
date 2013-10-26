# -*- encoding : utf-8 -*-
module RepliesHelper
	def can_edit_reply?(reply)
		unless current_user.nil?
			current_user.admin? || current_user.id == reply.user_id
		else
			false
		end
	end

	def all_replies_count
		Reply.count
	end
end
