# require 'rails_helper'
#
# feature "user can delete an idea" do
#   scenario "user sees index without his or her idea" do
#     user = create(:user)
#
#     visit login_path
#     fill_in "Username", with: user.username
#     fill_in "Password", with: "abcd"
#     click_button "Login"
#
#     idea = create(:idea)
#     visit user_idea_path(idea)
#
#     click_on "Delete Idea"
#
#     expect user_ideas_path
#
#     expect(page).to_not have_content "Great Idea"
#     expect(page).to_not have_content "Description of great idea"
#
#   end
# end
