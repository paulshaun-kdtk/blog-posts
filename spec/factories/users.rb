# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Internet.url }
    bio { Faker::Lorem.sentence }
    posts_counter { Faker::Number.number(digits: 2) }
  end
end
