FactoryBot.define do
  factory :psychologist do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
