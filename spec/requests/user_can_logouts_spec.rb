require 'rails_helper'

RSpec.describe "User can logout" do
  include Capybara::DSL
  scenario "user can see login page" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcdefgh"
    click_link "Logout"

    expect login_path

    expect(page).to_not have_content "Welcome, marina"
  end
end
