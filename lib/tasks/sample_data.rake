# -*- encoding : utf-8 -*-
namespace :db do
	desc "增加基础数据"
	task populate: :environment do
		make_users
		make_posts
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

def make_posts
	users = User.all(limit: 6)
	30.times do |n|
		content = Faker::Lorem.sentence(8)
		title = Faker::Lorem.paragraph[0..12]
		like_num = Random.rand(n+10)
		read_num = Random.rand(n+12)
		users.each {|user| user.posts.create!(title: title, content: content, like_num: like_num, read_num: read_num)}
	end
end
