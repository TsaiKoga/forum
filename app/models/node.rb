# -*- encoding : utf-8 -*-
class Node < ActiveRecord::Base
	has_many :topics

	belongs_to :section
end
