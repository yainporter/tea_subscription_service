# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

customer1 = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address )
customer2 = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address )
customer3 = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address )

puts "Customers created"


jasmine_green_tea = Tea.create!(title: "Jasmine Green Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
blueberry_white_tea = Tea.create!(title: "Blueberry White Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
morrocan_mint_tea = Tea.create!(title: "Morrocan Mint Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
vanilla_rooibos = Tea.create!(title: "Vanilla Rooibos", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
tropical_fruit_infusion = Tea.create!(title: "Tropical Fruit Infusion", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
matcha_pearls = Tea.create!(title: "Matcha Pearls", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
silver_tip_white = Tea.create!(title: "Silver Tip White", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
himalayan_spring = Tea.create!(title: "Himalayan Spring", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
golden_masala_chai = Tea.create!(title: "Golden Masala Chai", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
sunset_oolong = Tea.create!(title: "Sunset Oolong", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
earl_grey_tea = Tea.create!(title: "Earl Grey Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))

puts "Teas created"


blend_box = Subscription.create!(title: "Blend Box", price: 30, frequency: 2)
taste_test_trio = Subscription.create!(title: "Taste Test Trio", price: 30, frequency: 0)
leafy_luxuries = Subscription.create!(title: "Leafy Luxuries", price: 60, frequency: 1)
sereni_tea = Subscription.create!(title: "SereniTEA", price: 45, frequency: 2)

puts "Subscriptions created"


TeaSubscription.create!(tea_id: jasmine_green_tea.id, subscription_id: blend_box.id)
TeaSubscription.create!(tea_id: blueberry_white_tea.id, subscription_id: blend_box.id)
TeaSubscription.create!(tea_id: morrocan_mint_tea.id, subscription_id: blend_box.id)
TeaSubscription.create!(tea_id: vanilla_rooibos.id, subscription_id: blend_box.id)
TeaSubscription.create!(tea_id: tropical_fruit_infusion.id, subscription_id: blend_box.id)

TeaSubscription.create!(tea_id: jasmine_green_tea.id, subscription_id: taste_test_trio.id)
TeaSubscription.create!(tea_id: blueberry_white_tea.id, subscription_id: taste_test_trio.id)
TeaSubscription.create!(tea_id: earl_grey_tea.id, subscription_id: taste_test_trio.id)

TeaSubscription.create!(tea_id: matcha_pearls.id, subscription_id: leafy_luxuries.id)
TeaSubscription.create!(tea_id: silver_tip_white.id, subscription_id: leafy_luxuries.id)
TeaSubscription.create!(tea_id: himalayan_spring.id, subscription_id: leafy_luxuries.id)
TeaSubscription.create!(tea_id: golden_masala_chai.id, subscription_id: leafy_luxuries.id)
TeaSubscription.create!(tea_id: sunset_oolong.id, subscription_id: leafy_luxuries.id)

TeaSubscription.create!(tea_id: jasmine_green_tea.id, subscription_id: sereni_tea.id)
TeaSubscription.create!(tea_id: himalayan_spring.id, subscription_id: sereni_tea.id)
TeaSubscription.create!(tea_id: matcha_pearls.id, subscription_id: sereni_tea.id)
TeaSubscription.create!(tea_id: vanilla_rooibos.id, subscription_id: sereni_tea.id)

puts "TeaSubscriptions created"


CustomerSubscription.create!(customer_id: customer1.id, subscription_id: sereni_tea.id, start_date: Faker::Date.between(from: "2023-01-01", to: "2023-05-01").strftime("%m/%d/%Y"))
CustomerSubscription.create!(customer_id: customer1.id, subscription_id: blend_box.id, start_date: Faker::Date.between(from: "2023-01-01", to: "2023-05-01").strftime("%m/%d/%Y"))
CustomerSubscription.create!(customer_id: customer1.id, subscription_id: leafy_luxuries.id, start_date: Faker::Date.between(from: "2023-01-01", to: "2023-05-01").strftime("%m/%d/%Y"))

CustomerSubscription.create!(customer_id: customer2.id, subscription_id: taste_test_trio.id, start_date: Faker::Date.between(from: "2023-01-01", to: "2023-05-01").strftime("%m/%d/%Y"))

CustomerSubscription.create!(customer_id: customer3.id, subscription_id: leafy_luxuries.id, start_date: Faker::Date.between(from: "2023-01-01", to: "2023-05-01").strftime("%m/%d/%Y"))
CustomerSubscription.create!(customer_id: customer3.id, subscription_id: sereni_tea.id, start_date: Faker::Date.between(from: "2023-01-01", to: "2023-05-01").strftime("%m/%d/%Y"))

puts "CustomerSubscriptions created"
