require "rails_helper"

RSpec.describe CustomerSubscription, type: :model do
  describe "relationships" do
    it{ should belong_to(:customer) }
    it{ should belong_to(:subscription) }
  end

  describe "validations" do
    it { should validate_presence_of(:customer_id)}
    it { should validate_presence_of(:subscription_id)}
    it { should validate_presence_of(:status)}
    it { should validate_presence_of(:start_date)}
  end
end
