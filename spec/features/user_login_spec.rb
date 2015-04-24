require "rails_helper"

OmniAuth.config.test_mode = true

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

  it "can log in with twitter after waterspot registration" do
    user = User.create(username: "KyraWeb", password: "password", email: "kyra.m.weber@gmail.com")

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'provider' => 'twitter',
      'uid' => "2328988092",
      'info' => {
        'nickname' => 'KyraWeb',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
      }
    })

    visit root_path
    click_link_or_button("sign in")
    click_link_or_button("sign in with twitter")

    expect(page).to have_content(user.username)
  end

  it "cannot log in with twitter before waterspot registration" do
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'provider' => 'twitter',
      'uid' => "232898",
      'info' => {
        'nickname' => 'Bettyboop',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
      }
    })

    visit root_path
    click_link_or_button("sign in")
    click_link_or_button("sign in with twitter")

    expect(page).to have_content("Please register")
  end
end
