# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do
  describe "主页(Home Page)" do

    it "必须拥有标题\'Rails China\'(QuackFrog)" do
			visit '/static_pages/home'
			expect(page).to have_content('Rails China')
    end

  end

	describe "社区(Community Page)" do
		it "必须拥有" do
			visit '/static_pages/community'
		end
	end

	describe "酷站(Cool Site Page)" do
		it "必须拥有" do
			visit '/static_pages/cool_site'
		end
	end

	describe "会员(Member Page)" do
		it "必须拥有" do
			visit '/static_pages/member'
		end
	end
end
