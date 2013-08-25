# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Post do
	let(:user) {FactoryGirl.create(:user)}
	before do
		@post = Post.new(content: "My name is TsaiKoga", user_id: user.id)
	end

	describe "title不能为空" do
		before {@post.title = nil}
		it { should_not be_valid }
	end

	describe "title字数不能超过30" do
		before {@post.title = "a"*31}
		it { should_not be_valid }
	end

	describe "user_id不能为空" do
		before {@post.user_id = nil}
		it { should_not be_valid }
	end

	describe "空白的内容" do
		before {@post.content = " "}
		it { should_not be_valid }
	end

	subject{ @post }
	it {should respond_to (:content)}
	it {should respond_to (:user_id)}
	its(:user) { should eq user }

end
