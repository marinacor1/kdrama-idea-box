require 'rails_helper'

RSpec.describe "User can be created" do
  include Capybara::DSL
    it "user can create account" do
      visit signup_path
      fill_in "Username", with: "marina"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Create Account"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content "Welcome, marina"
    end

    it "user cannot create account if password is mismatched" do
      visit signup_path
      fill_in "Username", with: "marina"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password1"
      click_button "Create Account"

      expect(page).to_not have_content "Welcome, marina"
    end

    it "user cannot create account if username is missing" do
      visit signup_path
      fill_in "Username", with: ""
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password1"
      click_button "Create Account"

      expect(page).to_not have_content "Welcome, marina"
    end

    it "user cannot create account if password is missing" do
      visit signup_path
      fill_in "Username", with: "marina"
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: "password1"
      click_button "Create Account"

      expect(page).to_not have_content "Welcome, marina"
    end
end
