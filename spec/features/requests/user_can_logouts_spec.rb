require 'rails_helper'

RSpec.describe "User can logout" do
  include Capybara::DSL
  include FeaturesHelper
  scenario "user can see login page" do
    user = create(:user)

    login_setup

    expect(current_path).to eq(user_path(user))

    click_link "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content "Welcome, Marina"
  end
end
