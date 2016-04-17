require 'rails_helper'

feature "user can edit kdrama idea" do
  include FeaturesHelper
  scenario "user will see the updated idea on page" do
    user = create(:user)

    login_setup
    expect(current_path).to eq(user_path(user))

    click_on "New Idea"
    expect(current_path).to eq(new_idea_path)
    fill_in "Title", with: "The best pitch"
    fill_in "Description", with: "Dulce Maria dates Jude Law"
    click_on "Submit"
    expect(current_path).to eq(idea_path(Idea.last))

    click_on "Edit Idea"
    fill_in "Title", with: "The next best pitch"
    fill_in "Description", with: "Dulce Maria dumped Jude Law for Ji Chang Wook"
    click_on "Update Idea"

    expect(current_path).to eq(idea_path(Idea.last))

    expect(page).to have_content "The next best pitch"
    expect(page).to have_content  "Dulce Maria dumped Jude Law for Ji Chang Wook"
end
end
