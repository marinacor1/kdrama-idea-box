require 'rails_helper'

feature "user can edit kdrama idea" do
  scenario "user will see the updated idea on page" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcd"
    click_button "Login"

    new_idea = create(:idea)

    visit user_idea_path(new_idea)

    click_on "Edit Idea"
    fill_in "Title", with: "The next best pitch"
    fill_in "Description", with: "Dulce Maria dumped Jude Law for Ji Chang Wook"
    click_on "Update Idea"

    expect user_idea_path(new_idea)

    expect(page).to have_content "The next best pitch"
    expect(page).to have_content  "Dulce Maria dumped Jude Law for Ji Chang Wook"
end
end
