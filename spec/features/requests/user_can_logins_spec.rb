require 'rails_helper'

RSpec.describe "user can login" do
  include Capybara::DSL
  include FeaturesHelper
  scenario "user can see user landing page" do
    user = create(:user)

    login_setup

    expect(page).to have_content "Welcome, Marina"
  end

  scenario "user cannot see user landing page if password does not match" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcd123"
    click_button "Login"

    expect(page).to_not have_content "Welcome, Marina"
  end

  scenario "user cannot see user landing page if username does not exist" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: "Michael Jackson"
    fill_in "Password", with: "abcdefgh"
    click_button "Login"

    expect(page).to_not have_content "Welcome, Marina"
  end
end
