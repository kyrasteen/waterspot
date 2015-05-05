require "rails_helper"

describe "User authorization" do
  it "cannot visit another user's dashboard" do
    user = User.create(username: "kyra", password: "password", email: "kyra@example.com")
    user2 = User.create(username: "betty", password: "password", email: "betty@example.com")
    login_user(user)
    visit user_path(user2)
    expect(page).to have_content("Not authorized")
  end

end
