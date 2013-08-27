# -*- encoding : utf-8 -*-
require 'spec_helper'

describe TopicsController do

	describe "社区(Community Page)" do
		let(:user) {FactoryGirl.create(:user)}
		before do
			FactoryGirl.create(:topic, user: user, content: "My name is CKJ.", like_num: 3)
			FactoryGirl.create(:topic, user: user, content: "what's your name?", like_num: 5)
		end

		it "必须拥有帖子" do
			visit '/index'
			user.topics do |item|
				expect(page).to have_selector("a", text: "#{item.title}" )
			end
		end
	end

	
end
