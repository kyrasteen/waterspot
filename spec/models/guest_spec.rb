require "rails_helper"

describe "Guest", type: :model do
  it "nil? renders the guest nav view" do
    guest = Guest.new
    expect(guest.nil?).to eq("layouts/guest_nav")
  end
end
