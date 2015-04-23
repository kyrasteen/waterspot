require "rails_helper"

describe "User Register", :type => :feature do

  let(:user) { User.create(email:"betty@example.com", password: "password") }

  it "can go to register page" do
    visit root_path
    find(".register-link").click
    expect(page).to have_content("waterspot")
    expect(page).to have_content("sign in")
  end

  it "can register" do
    visit root_path
    find(".register-link").click
    fill_in(:user_username, with: "betty@example.com")
    fill_in(:user_email, with: "betty@example.com")
    fill_in(:user_password, with: "password")
    click_link_or_button("sign up")
    expect(page).to have_content("Welcome to waterspot")
  end

end
