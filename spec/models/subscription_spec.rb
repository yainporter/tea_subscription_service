require "rails_helper"

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it{ should have_many(:customer_subscriptions) }
    it{ should have_many(:tea_subscriptions) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:title)}
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:price)}
    it { should validate_numericality_of(:price)}
    it { should validate_presence_of(:frequency)}
  end
end
