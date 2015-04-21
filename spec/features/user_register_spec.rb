require "rails_helper"

describe "User Register", :type => :feature do
 xit "can go to register page" do
    visit root_path
    find(".register-link").click
    expect(page).to have_content("waterspot")
    expect(page).to have_content("sign in")
  end

 xit "can register" do
    visit root_path
    find(".register-link").click
    fill_in(:user_email, with: "betty@example.com")
    fill_in(:user_password, with: "password")
    fill_in(:user_confirm_password, with: "password")
    click_link_or_button("sign up")
    expect(page).to have_content("successfully registered")
  end
end
