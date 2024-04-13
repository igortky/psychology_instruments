FactoryBot.define do
  factory :instrument do
    name { Faker::Games::Witcher.book }
  end
end
