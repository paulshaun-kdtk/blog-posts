# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Internet.url }
    bio { Faker::Lorem.sentence }
    posts_counter { Faker::Number.number(digits: 2) }
  end

  factory :comment do
    association :user
    association :post
    text { Faker::Lorem.paragraph }

    after(:build, &:set_timestamps)

    trait :with_timestamps do
      created_at { Faker::Time.backward(days: 10) }
      updated_at { Faker::Time.backward(days: 5) }
    end
  end
end
