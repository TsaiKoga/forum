# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    topic_id 1
    content "MyText"
    like_num 1
  end
end
