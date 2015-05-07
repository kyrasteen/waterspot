require 'rails_helper'

describe User, type: :model do

  context "is valid" do
    it "with correct attributes" do
      user = User.create(username: "kyra", email: "ky@example.com", password: "password", avatar: "giraffe.jpg")
      expect(user).to be_valid
    end

    it "can have many spots" do
      user = User.create(username: "kyra", email: "kyra@example.com", avatar: "giraffe.jpg")
      expect(user.spots).to eq([])
    end
  end

  context "is invalid" do
    it "has missing attributes" do
      user = User.create(username: "kyra", email: "", avatar:"")
      expect(user).not_to be_valid
    end
  end

end
