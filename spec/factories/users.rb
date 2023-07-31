FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_user#{n}@gmail.com" }
    password { Faker::Internet.password }
  end
end
