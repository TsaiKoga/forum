# -*- encoding : utf-8 -*-
namespace :db do
	desc "增加基础数据"
	task populate: :environment do
		make_users
		make_nodes
		make_topics
	end
end

def make_users
	admin = User.create!(name: "TsaiKoga",
											 email: "caikejia007@gmail.com",
											 password: "12345678",
											 password_confirmation: "12345678",
											 admin: true)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(name: name, email: email, password: password, password_confirmation: password)
	end
end

def make_nodes
	5.times do |n|
		name = Faker::Name.name
		summary = Faker::Lorem.paragraph[0..10]
		sort = Random.rand(n+2)
		topics_count = Random.rand(n+4)
		Node.create!(name: name, summary: summary, sort: sort, topics_count: topics_count)
	end
end

def make_topics
	users = User.all(limit: 6)
	nodes = Node.all
	30.times do |n|
		content = Faker::Lorem.sentence(8)
		title = Faker::Lorem.paragraph[0..12]
		like_num = Random.rand(n+10)
		read_num = Random.rand(n+12)
		users.each {|user| user.topics.create!(title: title, content: content, like_num: like_num, read_num: read_num, node_id: nodes.first.id)}
	end
end
