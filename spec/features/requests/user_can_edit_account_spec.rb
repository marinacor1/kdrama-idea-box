require 'rails_helper'

feature 'User can edit an existing account' do
  include FeaturesHelper
  scenario 'updated account is viewable' do
    user = create(:user)
    login_setup
    click_link "Edit Account"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "Username", with: "newuser"

    click_on "Update Account"
    expect(page).to have_content("Newuser")
  end
end
