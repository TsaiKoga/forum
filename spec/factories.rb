FactoryGirl.define do
  factory :user do
		sequence(:name) {|n| "Person #{n}"}
    sequence(:email) {|n| "person_#{n}@email.com"}
    password "12345678"
    password_confirmation "12345678"

		factory :admin do
			admin true
		end
  end

	factory :topic do
		sequence(:title) {|n| "Title #{n}"}
    sequence(:content) {|n| "content #{n} to Read"}
		like_num 12
		read_num 40
		user
	end
end
