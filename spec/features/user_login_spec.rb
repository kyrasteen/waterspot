require "rails_helper"

describe "User login", type: :feature do
  it "can log in" do
    user = User.create(username: "kyra", password: "password", email: "kyra@example.com")
    login_user(user)
    expect(page).to have_content("dashboard")
  end

  it "can log out" do
    user = User.create(username: "kyra", password: "password", email: "kyra@example.com")
    login_user(user)
    click_link_or_button("sign out")
    expect(page).to have_content("signed out")
  end
end
