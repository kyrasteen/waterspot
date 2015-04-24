require "rails_helper"

describe "Homepage View", :type => :feature do
  it "shows waterspot heading" do
    visit root_path
    expect(page).to have_content("waterspot")
    expect(page).to have_content("sign in")
  end
end



