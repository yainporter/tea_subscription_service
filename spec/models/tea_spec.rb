require "rails_helper"

RSpec.describe Tea, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_uniqueness_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_uniqueness_of(:description)}
    it { should validate_presence_of(:temperature)}
    it { should validate_presence_of(:brew_time)}
    it { should validate_numericality_of(:temperature)}
    it { should validate_numericality_of(:brew_time)}
  end
end
