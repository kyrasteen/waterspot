def login_user(user)
    visit root_path
    find(".login-link").click
    fill_in(:session_email, with: user.email)
    fill_in('pass', with: user.password)
    fill_in('confirm', with: user.password)
    within('.login-form') do
      click_link_or_button("login")
    end
end
