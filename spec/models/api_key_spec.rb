require 'rails_helper'

describe ApiKey, type: :model do
  it "has a token" do
    key = ApiKey.create(token: "secret")
    expect(key.token).to eq("secret")
  end
end
