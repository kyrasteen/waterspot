require "rails_helper"

describe "User login", type: :feature do
  it "can sign in with twitter" do
    user = User.create(username: "kyra", password: "password", email: "kyra@example.com")
    login_user(user)
  end
end
