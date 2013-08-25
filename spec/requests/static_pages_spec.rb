# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do
  describe "主页(Home Page)" do
		subject {page}

    it "必须拥有标题\'Rails China\'和导航('首页')" do
			visit '/'
			expect(page).to have_content('Rails China')
			expect(page).to have_content('首页')
    end

		describe "显示高分帖子" do
			let(:user) {FactoryGirl.create(:user)}
			before do
				FactoryGirl.create(:post, user: user, content: "My name is CKJ.", like_num: 3)
				FactoryGirl.create(:post, user: user, content: "what's your name?", like_num: 5)
			end

			it "高分帖子中必须有一条帖子" do
				user.posts do |item|
					expect(page).to have_selector("li#{item.id}", text: item.content)
				end
			end

		end
  end

	describe "社区(Community Page)" do
		it "必须拥有" do
			visit '/community'
		end
	end

	describe "酷站(Cool Site Page)" do
		it "必须拥有" do
			visit '/cool_site'
		end
	end

	describe "会员(Member Page)" do
		it "必须拥有" do
			visit '/member'
		end
	end

	describe "注册" do
		it "必须拥有注册按钮" do
			visit "/users/sign_up"
			expect(page).to have_button('提交注册信息')
		end
	end

	describe "关于(About)" do
		it "必须拥有\'关于\'" do
			visit '/about'
			expect(page).to have_content('关于')
		end
	end
end
