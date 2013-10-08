require 'spec_helper'

describe Reply do
	let(:user) {FactoryGirl.create(:user)}
	let(:topic) {FactoryGirl.create(:topic)}

	before do
		@reply = Reply.new(content: "Good.I like it.", user_id: user.id, topic_id: topic.id)
	end

	describe "content不能为空" do
		before {@reply.content = " "}
		it {should_not be_valid}
	end

	describe "content不能超过100字" do
		before {@reply.content = "a"*101}
		it {should_not be_valid}
	end

	describe "user_id不能为空" do
		before {@reply.user_id = nil}
		it {should_not be_valid}
	end

	describe "topic_id不能为空" do
		before {@reply.topic_id = nil}
		it {should_not be_valid}
	end

	subject{@reply}
	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
	it {should respond_to(:topic_id)}
	its(:user) {should eq user}
	its(:topic) {should eq topic}
end
