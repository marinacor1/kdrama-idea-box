require 'rails_helper'

feature "user can edit kdrama idea" do
  scenario "user will see the updated idea on page" do
    new_idea = Idea.create(title: "The most amazing pitch", description: "Jude Law and Dulce Maria fall in love under the moon.")

    visit idea_path(new_idea)

    click_on "Edit Idea"
    fill_in "Title", with: "The next best pitch"
    fill_in "Description", with: "Dulce Maria dumped Jude Law for Ji Chang Wook"
    click_on "Update Idea"

    expect(page).to have_content "The next best pitch"
    expect(page).to have_content  "Dulce Maria dumped Jude Law for Ji Chang Wook"
end
end
