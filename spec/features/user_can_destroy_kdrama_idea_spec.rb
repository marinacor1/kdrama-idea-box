require 'rails_helper'

feature "user can delete an idea" do
  include FeaturesHelper
  scenario "user sees index without his or her idea" do
    pitch_title = "Muderous Rampage Meets Love"
    pitch_description = "Lee MinHo falls in love with Anahi in the midst of a Zombie Apocalypse. Mexican and Korean love at first sight."

    user = create(:user)

    login_setup
    expect(current_path).to eq(user_path(user))

    click_on "New Idea"
    expect(current_path).to eq(new_idea_path)
    # select category, from: "title"
    fill_in "Title", with: pitch_title
    fill_in "Description", with: pitch_description

    #TODO select image from box
    click_on "Submit"
    expect(current_path).to eq(idea_path(Idea.last))

    click_on "Delete Idea"
    expect(current_path).to eq(ideas_path)
    
    expect(page).to_not have_content "Great Idea"
    expect(page).to_not have_content "Description of great idea"

  end
end
