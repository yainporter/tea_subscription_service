require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it{ should have_many(:customer_subscriptions) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name)}
  end
end
