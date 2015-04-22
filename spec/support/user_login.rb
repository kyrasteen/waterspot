def login_user(email, password)
  visit root_path
  find(".register-link").click
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  fill_in(:user_password, with: password)
  click_link_or_button("sign up")
end
