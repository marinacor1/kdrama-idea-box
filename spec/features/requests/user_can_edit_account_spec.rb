# require 'rails_helper'
#
# feature 'User can edit an existing account' do
#   include FeaturesHelper
#   scenario 'updated account is viewable' do
#     login_setup
# save_and_open_page
#     click_link "Edit Account"
#
#     expect(page).to have_content("Edit account")
#
#     fill_in "Username", with: "newuser"
#     fill_in "Email", with: "email@email.com"
#
#     click_on "Update account"
#
#     expect(page).to have_content("Newuser")
#     expect(page).to have_content("email@email.com")
#
#   end
# end
