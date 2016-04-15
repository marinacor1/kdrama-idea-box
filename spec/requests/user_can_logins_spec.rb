require 'rails_helper'

RSpec.describe "user can login" do
  scenario "user can see user landing page" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcd"
    click_button "Login"

    expect ideas_path
    
    expect(page).to have_content "Welcome, marina"
  end
end
