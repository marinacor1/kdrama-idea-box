require 'rails_helper'

RSpec.describe "User can be created" do
    it "use can create account" do
      fill_in "Username", with: "marina"
      fill_in "Password", with: "password"
      click_button "Create Account"

      expect(page).to have_content "Welcome, marina"
    end
end
