require 'rails_helper'

#idea is created
#user visits idea show page
#user clicks on edit link
#user changes fields for title
#user changes field for description
#user clicks update idea link
#user sees on show page the updated information

feature "user can edit kdrama idea" do
  scenario "user will see the updated idea on page" do
    new_idea = Idea.create(title: "The most amazing pitch", description: "Jude Law and Dulce Maria fall in love under the moon.")

    visit idea_path(new_idea)

    click_on "Edit Idea"

    fill_in "Title", with: "The next best pitch"
    fill_in "Description", with: "Dulce Maria dumped Jude Law for Ji Chang Wook"
    click_on "Update Idea"

    expect(page).to have_content "The next best pitch"
    expect(page).to have_content  "Jude Law and Dulce Maria fall in love under the moon."
  end
end
