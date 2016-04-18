module FeaturesHelper

  def login_setup
    visit login_path
    fill_in "Username", with: "marina"
    fill_in "Password", with: "abcdefgh"
    click_button "Login"
  end

  def admin_login
    visit login_path
    fill_in "Username", with: "adminor"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
