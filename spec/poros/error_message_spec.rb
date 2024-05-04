require "rails_helper"

describe ErrorMessage do
  it "exists" do
    expect(ErrorMessage.new("Error", 404)).to be_an ErrorMessage
  end

  it "has two attributes" do
    error = ErrorMessage.new("Error", 404)

    expect(error.message).to eq("Error")
    expect(error.status).to eq(404)
  end
end
