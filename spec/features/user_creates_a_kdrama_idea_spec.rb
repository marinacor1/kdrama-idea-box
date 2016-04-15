require 'rails_helper'

feature "user can submit kdrama idea" do
  scenario "user will see idea, category and image on page" do
    category = 'Historical Apocolyptic Comedy'
    pitch_title = "Muderous Rampage Meets Love"
    pitch_description = "Lee MinHo falls in love with Anahi in the midst of a Zombie Apocalypse. Mexican and Korean love at first sight."
    visit ideas_path
    click_on "New Idea"

    expect new_idea_path
    # select category, from: "title"
    fill_in "Title", with: pitch_title
    fill_in "Description", with: pitch_description

    #TODO select image from box
    click_on "Submit"
    within("li:first") do
      expect(page).to have_content pitch_title
      expect(page).to have_content pitch_description
    end
    expect(page).to have_link "All Ideas", href: ideas_path
  end

  scenario "user cannot create idea without title" do
    pitch_description = "Lee MinHo falls in love with Anahi in the midst of a Zombie Apocalypse. Mexican and Korean love at first sight."
    visit ideas_path
    click_on "New Idea"

    expect new_idea_path
    # select category, from: "title"
    fill_in "Description", with: pitch_description

    #TODO select image from box
    click_on "Submit"

    expect(page).to have_content "Title can't be blank"

    expect new_idea_path
    expect(page).to_not have_content pitch_description
  end

  scenario "user cannot create idea without description" do
    pitch_title = "Muderous Rampage Meets Love"

    visit ideas_path
    click_on "New Idea"

    expect new_idea_path
    # select category, from: "title"
    fill_in "Title", with: pitch_title
    #TODO select image from box
    click_on "Submit"

    expect(page).to have_content "Description can't be blank"

    expect new_idea_path

    expect(page).to_not have_content pitch_title
  end
end
