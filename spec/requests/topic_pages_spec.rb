# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "TopicPages" do
	subject{ page }

	describe "社区(Community Page)" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			FactoryGirl.create(:topic, user: user, content: "My name is CKJ.", like_num: 3, read_num: 2)
			FactoryGirl.create(:topic, user: user, content: "what's your name?", like_num: 5, read_num: 3)

			visit topics_path
		end

		it "必须拥有帖子" do
			user.topics do |item|
				expect(page).to have_selector("a", text: "#{item.title}" )
			end
		end

		let(:first_topic) { user.topics.first }
		it "帖子必须增加阅读数" do
			expect{ click_link "#{first_topic.title}" }.to change(first_topic, :read_num).by(1)
		end

	end

end
