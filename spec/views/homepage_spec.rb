require "rails_helper"
require "spec_helper"

describe "Homepage View", :type => :feature do
  it "shows waterspot heading" do
    visit root_path
    expect(page).to have_content("Waterspot")
    expect(page).to have_content("Login")
  end
end



