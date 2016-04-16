require 'rails_helper'

RSpec.describe "User can logout" do
  include Capybara::DSL
  scenario "user can see login page" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcdefgh"
    click_button "Login"

    expect(current_path).to eq(ideas_path)

    click_link "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content "Welcome, marina"
  end
end
