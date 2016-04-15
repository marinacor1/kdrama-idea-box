require 'rails_helper'

RSpec.describe "User can be created" do
  include Capybara::DSL
    it "user can create account" do
      visit new_user_path
      fill_in "Username", with: "marina"
      fill_in "Password", with: "password"
      click_button "Create Account"

      expect(page).to have_content "Welcome, marina"
    end
end
