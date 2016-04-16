module FeaturesHelper

  def login_setup
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "abcdefgh"
    click_button "Login"
  end

end
