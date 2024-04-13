FactoryBot.define do
  factory :evaluatee do
    name { Faker::Name }
    email { Faker::Internet.email }
    cpf { rand.to_s[2..12] }
    birthdate { Time.now.zone }
    psychologist
  end
end
