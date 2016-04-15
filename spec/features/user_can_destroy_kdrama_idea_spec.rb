require 'rails_helper'

feature "user can delete an idea" do
  scenario "user sees index without his or her idea" do
    idea = create(:idea)
    visit idea_path(idea)

    click_on "Delete Idea"

    expect ideas_path

    expect(page).to_not have_content "Great Idea"
    expect(page).to_not have_content "Description of great idea"

  end
end
