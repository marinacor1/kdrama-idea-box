require 'rails_helper'

feature "user can submit kdrama idea" do
  include FeaturesHelper
  scenario "user will see idea, category and image on page" do
    category = 'Historical Apocolyptic Comedy'
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
    #currently we see the user show page
    #idea show page from within the current user
    expect(current_path).to eq(idea_path(Idea.last))

    within("li:first") do
      expect(page).to have_content pitch_title
      expect(page).to have_content pitch_description
    end
    expect(page).to have_link "All Ideas", href: ideas_path
  end

  scenario "user can view previous ideas" do
    first_idea = Idea.create(title: "The most amazing pitch", description: "Jude Law and Dulce Maria fall in love under the moon.")
    second_idea = Idea.create(title: "The second most amazing pitch", description: "Jude Law and Anahi fall in love under the moon.")

    user = create(:user)
    login_setup

    click_on "All My Ideas"

    expect(current_path).to eq(ideas_path)

    within("li:first") do
      expect(page).to have_content "The most amazing pitch"
      expect(page).to have_content "Jude Law and Dulce Maria fall in love under the moon."
    end

    within("li:last") do
      expect(page).to have_content "The second most amazing pitch"
      expect(page).to have_content "Jude Law and Anahi fall in love under the moon."
    end
  end

  xscenario "user cannot create idea without title" do
    pitch_description = "Lee MinHo falls in love with Anahi in the midst of a Zombie Apocalypse. Mexican and Korean love at first sight."
    user = create(:user)
    login_setup

    expect(current_path).to eq(user_path(user))

    click_on "New Idea"

    expect(current_path).to eq(new_idea_path)
    # select category, from: "title"
    fill_in "Description", with: pitch_description

    #TODO select image from box
    click_on "Submit"

    expect(page).to have_content "Title can't be blank"

    expect(current_path).to eq(new_idea_path)
    expect(page).to_not have_content pitch_description
  end

  xscenario "user cannot create idea without description" do
    pitch_title = "Muderous Rampage Meets Love"
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcdefgh"
    click_button "Login"

    visit ideas_path(user)
    click_on "New Idea"

    expect new_user_idea_path(user)
    # select category, from: "title"
    fill_in "Title", with: pitch_title
    #TODO select image from box
    click_on "Submit"

    expect(page).to have_content "Description can't be blank"

    expect new_idea_path(user)

    expect(page).to_not have_content pitch_title
  end
end
