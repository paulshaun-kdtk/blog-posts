# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'KDTK' }
    bio { 'Graphic designer' }
    photo { 'http://hello.com/org.png' }
    posts_counter { 0 }
  end
end
