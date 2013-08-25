# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
	let(:user) {FactoryGirl.create(:user)}

	it { should respond_to(:admin)}

	it { should_not be_admin }

	describe "设置管理员身份" do
		before do
			user.save!
			user.toggle!(:admin)
		end
		it { should be_admin }
	end

end
