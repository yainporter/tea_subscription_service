require "rails_helper"

RSpec.describe TeaSubscription, type: :model do
  describe "validations" do
    it { should validate_presence_of(:tea_id)}
    it { should validate_presence_of(:subscription_id)}
  end
end
