# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    name "MyString"
    summary "MyString"
    sort 1
    topics_count 1
  end
end
