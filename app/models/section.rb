# -*- encoding : utf-8 -*-
class Section < ActiveRecord::Base
	has_many :nodes

	def sorted_nodes
		self.nodes
	end
end
