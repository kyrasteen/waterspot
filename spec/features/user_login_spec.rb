require "rails_helper"

describe "User login", type: :feature do
  xit "can sign in with twitter" do
    visit root_path
    find(".login-link").click
    find(".login-twitter-link").click
    expect(current_path).to be("/oauth/authenticate")
  end
end
