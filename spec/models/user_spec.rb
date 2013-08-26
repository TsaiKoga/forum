# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
	let(:user) {FactoryGirl.create(:user)}
	before {@user = user}
	subject{ @user }

	it { should respond_to(:admin)}
	it { should respond_to(:signature)}
	it { should respond_to(:introduction)}

	it { should_not be_admin }

	describe "设置管理员身份" do
		before do
			@user.save!
			@user.toggle!(:admin)
		end
		it { should be_admin }
	end

	describe "个性签名字符不得超过25字" do
		before do
			before {@user.signature = "a"*26}

			it { should_not be_valid}
		end
	end

	describe "个人介绍不能超过500字" do
		before do
			before {@user.introduction = "a"*500}

			it { should_not be_valid}
		end
	end

end
