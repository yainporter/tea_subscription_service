require "rails_helper"

RSpec.describe "Customer Subscriptions Request" do
  before do
    @customer = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address)
    @customer2 = Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address)

    jasmine_green_tea = Tea.create!(title: "Jasmine Green Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    blueberry_white_tea = Tea.create!(title: "Blueberry White Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    morrocan_mint_tea = Tea.create!(title: "Morrocan Mint Tea", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    vanilla_rooibos = Tea.create!(title: "Vanilla Rooibos", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))
    tropical_fruit_infusion = Tea.create!(title: "Tropical Fruit Infusion", description: Faker::Lorem.sentence, temperature: Faker::Number.between(from: 167, to: 212), brew_time: Faker::Number.between(from: 1, to: 4))

    @blend_box = Subscription.create!(title: "Blend Box", price: 30, frequency: 2)

    TeaSubscription.create!(tea_id: jasmine_green_tea.id, subscription_id: @blend_box.id)
    TeaSubscription.create!(tea_id: blueberry_white_tea.id, subscription_id: @blend_box.id)
    TeaSubscription.create!(tea_id: morrocan_mint_tea.id, subscription_id: @blend_box.id)
    TeaSubscription.create!(tea_id: vanilla_rooibos.id, subscription_id: @blend_box.id)
    TeaSubscription.create!(tea_id: tropical_fruit_infusion.id, subscription_id: @blend_box.id)

    CustomerSubscription.create(customer_id: @customer.id, subscription_id: @blend_box.id)
  end

  describe "GET 'v0/api/subscriptions'" do
    describe "success" do
      it "returns all of a Customer's subscriptions", :vcr do

        request_body = {
          subscription: {
            customer_id: @customer.id
          }
        }

        get "/api/v0/customers/#{@customer.id}/subscriptions", params: request_body

        expect(response).to be_successful
        expect(response.status).to eq(200)

        response_data = JSON.parse(response.body, symbolize_names: true)
        data_keys = [:id, :type, :attributes]
        attribute_keys = [:title, :price, :frequency]

        expect(response_data[:data]).to be_an(Array)
        expect(response_data[:data].first.keys).to eq(data_keys)
        expect(response_data[:data].first[:attributes].keys).to eq(attribute_keys)
        expect(response_data).to eq({
          :data=>[{
            :id=> "#{@blend_box.id}",
            :type=>"subscription",
            :attributes=>{
              :title=>"Blend Box",
              :price=>30,
              :frequency=>"Bi-weekly"
            }
          }]
        })
      end

      it "returns an empty array if customer doesn't have subscriptions", :vcr do
        get "/api/v0/customers/#{@customer2.id}/subscriptions"
        expect(response).to be_successful
        expect(response.status).to eq(200)

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response_data).to eq(data: [])
      end
    end

    describe "failure" do
      it "returns 404 if Customer doesn't exist", :vcr do
        get "/api/v0/customers/5/subscriptions"

        expect(response).to_not be_successful
        expect(response.status).to eq(404)

        data = JSON.parse(response.body, symbolize_names: true)
        expect(data[:errors].first[:detail]).to eq("Couldn't find Customer with 'id'=5")
      end
    end
  end
end
