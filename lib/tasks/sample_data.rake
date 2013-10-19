# -*- encoding : utf-8 -*-
namespace :db do
	desc "增加基础数据"
	task populate: :environment do
		make_users
		make_sections
		make_nodes
		make_topics
		make_replies
	end
end

def make_users
	admin = User.create!(name: "TsaiKoga",
											 email: "caikejia007@gmail.com",
											 password: "12345678",
											 password_confirmation: "12345678",
											 admin: true)
	99.times do |n|
		name = "#{Faker::Internet.user_name}-#{n}s"
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(name: name, email: email, password: password, password_confirmation: password)
	end
end

def make_sections
	3.times do |n|
		name = Faker::Name.name
		sort = Random.rand(n+3)
		Section.create!(name: name, sort: sort)
	end
end

def make_nodes
	15.times do |n|
		name = Faker::Name.name
		summary = Faker::Lorem.paragraph[0..10]
		sort = Random.rand(n+2)
		topics_count = Random.rand(n+4)
		section_id = Random.rand(1..3)
		Node.create!(name: name, summary: summary, sort: sort, topics_count: topics_count, section_id: section_id)
	end
end

def make_topics
	users = User.all(limit: 6)
	nodes = Node.all
	30.times do |n|
		content = Faker::Lorem.sentences(8)
		title = Faker::Lorem.paragraph[0..12]
		like_num = Random.rand(n+10)
		read_num = Random.rand(n+12)
		users.each {|user| user.topics.create!(title: title, content: content, like_num: like_num, read_num: read_num, node_id: nodes.first.id)}
	end
end

def make_replies
	topics = Topic.all(limit: 17)
	15.times do |n|
		content = Faker::Lorem.sentences(4)
		like_num = Random.rand(n+10)
		user_id = Random.rand(98)+1
		replies = topics.each {|topic| topic.replies.create!(content: content, like_num: like_num, user_id: user_id )}
	end
end
