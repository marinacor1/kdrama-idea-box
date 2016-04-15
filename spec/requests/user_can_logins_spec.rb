require 'rails_helper'

RSpec.describe "user can login" do
  include Capybara::DSL
  scenario "user can see user landing page" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcdefgh"
    click_button "Login"

    expect user_ideas_path(user)

    expect(page).to have_content "Welcome, marina"
  end
end
