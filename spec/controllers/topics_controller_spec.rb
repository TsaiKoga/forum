# -*- encoding : utf-8 -*-
require 'spec_helper'

describe TopicsController do
	subject { page }
	let(:user) { FactoryGirl.create(:user) }

	before{ sign_in user }

	describe "创建帖子" do
		before { visit new_topic_path }

		describe "正确地创建帖子" do
			before do 
				fill_in 'topic_title', with: "Lorem ipsum" 
				fill_in 'topic_content', with: "Yep. She is a bitch." 
			end
			
			it "增加帖子数" do
				expect { click_button "保存" }.to change(Topic, :count).by(1)
			end
		end
	end
	
end
