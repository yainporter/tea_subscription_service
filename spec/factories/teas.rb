FactoryBot.define do
  factory :teas do
    title { Faker::Lorem.words(2) }
    description { Faker::Lorem.sentence }
    brew_time { Faker::Number.between(from: 1, to: 4) }
    temperature { Faker::Number.between(from: 167, to: 212) }
  end
end
