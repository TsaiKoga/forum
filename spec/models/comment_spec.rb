# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Comment do
	let(:user) {FactoryGirl.create(:user)}
	let(:post) {FactoryGirl.create(:post)}

	before do
		@comment = Comment.new(content: "Good.I like it.", user_id: user.id, post_id: post.id)
	end

	describe "content不能为空" do
		before {@comment.content = " "}
		it {should_not be_valid}
	end

	describe "content不能超过100字" do
		before {@comment.content = "a"*101}
		it {should_not be_valid}
	end

	describe "user_id不能为空" do
		before {@comment.user_id = nil}
		it {should_not be_valid}
	end

	describe "post_id不能为空" do
		before {@comment.post_id = nil}
		it {should_not be_valid}
	end

	subject{@comment}
	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
	it {should respond_to(:post_id)}
	its(:user) {should eq user}
	its(:post) {should eq post}
end
