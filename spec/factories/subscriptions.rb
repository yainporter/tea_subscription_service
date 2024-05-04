FactoryBot.define do
  factory :subscriptions do
    title { Faker::Lorem.word }
    price { Faker::Number.between(from: 10, to: 40) }
    frequency { Faker::Number.between(from: 0, to: 2) }
  end
end
