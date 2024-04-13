FactoryBot.define do
  factory :instrument do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
