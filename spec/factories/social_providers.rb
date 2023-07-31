FactoryBot.define do
  factory :social_provider do
    association :user
    provider { "gitlab" }
    email { Faker::Internet.email }
    sub { Faker::Number.unique.number(digits: 10) }
  end
end
