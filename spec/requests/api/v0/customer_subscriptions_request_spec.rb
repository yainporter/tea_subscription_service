require "rails_helper"

RSpec.describe "Customer Subscriptions Request" do
  before do
    customer1 = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address)

    jasmine_green_tea = Tea.create!(title: "Jasmine Green Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    blueberry_white_tea = Tea.create!(title: "Blueberry White Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    morrocan_mint_tea = Tea.create!(title: "Morrocan Mint Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    vanilla_rooibos = Tea.create!(title: "Vanilla Rooibos", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    tropical_fruit_infusion = Tea.create!(title: "Tropical Fruit Infusion", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))

    blend_box = Subscription.create!(title: "Blend Box", price: 30, frequency: 2)

    TeaSubscription.create!(tea_id: jasmine_green_tea.id, subscription_id: blend_box.id)
    TeaSubscription.create!(tea_id: blueberry_white_tea.id, subscription_id: blend_box.id)
    TeaSubscription.create!(tea_id: morrocan_mint_tea.id, subscription_id: blend_box.id)
    TeaSubscription.create!(tea_id: vanilla_rooibos.id, subscription_id: blend_box.id)
    TeaSubscription.create!(tea_id: tropical_fruit_infusion.id, subscription_id: blend_box.id)
  end
  describe "POST 'api/v0/customer_subscriptions'" do
    describe "successful response" do
      let(:customer) { Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address ) }
      it "returns 201 status", :vcr do
        post "/api/v0/customer_subscriptions", headers: headers, params: JSON.generate(customer_id: customer.id, subscription: subscription.id)
      end
    end
  end
end
