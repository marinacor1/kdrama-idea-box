require 'rails_helper'

feature "user can delete an idea" do
  scenario "user sees index without his or her idea" do
    new_idea = Idea.create(title: "The most amazing pitch", description: "Jude Law and Dulce Maria fall in love under the moon.")

    visit idea_path(new_idea)

    click_on "Delete Idea"

    expect ideas_path
    
    expect(page).to_not have_content "The most amazing pitch"
    expect(page).to_not have_content "Jude Law and Dulce Maria fall in love under the moon."

  end
end
