require 'rails_helper'

feature 'User can edit an existing account' do
  include FeaturesHelper
  scenario 'updated account is viewable' do
    user = create(:user)
    login_setup
    click_link "Edit Account"

    expect(current_path).to eq(user_path(user))

    fill_in "Username", with: "newuser"
    fill_in "Email", with: "email@email.com"

    click_on "Update account"

    expect(page).to have_content("Newuser")
    expect(page).to have_content("email@email.com")
  end
end
