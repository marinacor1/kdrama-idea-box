# require 'rails_helper'
#
# feature 'User can destroy own account' do
#   include FeaturesHelper
#   scenario 'profile page is no longer viewable' do
#     user = create(:user)
#
#     login_setup
#
#     click_on "Delete Account"
#
#     expect(page).to_not have_content("Welcome")
#     expect(page).to have_content("Welcome to KDRAMA")
#     expect(page).to have_content("Sign Up for free!")
#   end
# end
