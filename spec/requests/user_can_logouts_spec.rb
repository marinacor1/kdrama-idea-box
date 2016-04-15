# require 'rails_helper'
#
# RSpec.describe "User can logout" do
#   include Capybara::DSL
#   scenario "user can see login page" do
#     user = create(:user)
#
#     visit user_login_path
#     fill_in "Username", with: user.username
#     fill_in "Password", with: "abcd"
#     click_link "Logout"
#
#     expect user_login_path
#
#     refute page.to have_content "Welcome, marina"
#   end
# end
