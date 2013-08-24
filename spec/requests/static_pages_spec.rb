# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do
  describe "主页(Home Page)" do

    it "必须拥有标题\'Rails China\'和导航('首页')" do
			visit '/'
			expect(page).to have_content('Rails China')
			expect(page).to have_content('首页')
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
