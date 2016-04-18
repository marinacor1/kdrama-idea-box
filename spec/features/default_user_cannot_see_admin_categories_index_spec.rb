require 'rails_helper'

RSpec.describe "default user does not see admin categories index" do
  include FeaturesHelper
  it "user sees error message when trying to access" do
    user = User.create(username: "default_user", password: "password", password_confirmation: "password", role:0)

    login_setup
    visit admin_categories_path

    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
