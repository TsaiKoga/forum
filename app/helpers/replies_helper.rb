# -*- encoding : utf-8 -*-
module RepliesHelper
	def can_edit_reply?(reply)
		current_user.admin? || current_user.id == reply.user_id
	end
end
