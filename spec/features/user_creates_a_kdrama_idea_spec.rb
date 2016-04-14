require 'rails_helper'

#As a User
#when I visit the idea index
#And I click on "I have a bombass idea for the latest blockbuster"
#And I Select my category from the drop down menu
#And I fill in the title
#And I fill in the idea description
#And I choose an image
#And I click "Submit my idea"
#Then I should see the idea, category and image on the page(show)

RSpec.feature "user can submit kdrama idea" do
  scenario "user willl see idea, category and image on page" do
    category = 'Historical Apocolyptic Comedy'
    pitch_title = "Muderous Rampage Meets Love"
    pitch_description = "Lee MinHo falls in love with Anahi in the midst of a Zombie Apocalypse. Mexican and Korean love at first sight."
    visit ideas_path
    click_on "I have a bombass idea for the latest blockbuster"

    expect new_idea_path
    select category, from: "title"
    fill_in "title", with: pitch_title
    fill_in "description", with: pitch_description
    #TODO select image from box
    click_on "Submit"

    within("li:first") do 
      expect(page).to have_content pitch_title
      expect(page).to have_content pitch_description
    end
  end
end
