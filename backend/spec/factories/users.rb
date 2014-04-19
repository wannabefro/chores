# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}"}
    sequence(:email) {|n| "test#{n}@test.com"}
    password 'password'
  end
end
