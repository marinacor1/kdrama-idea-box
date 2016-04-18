require "rails_helper"

  RSpec.describe "Logged in admin sees categories index" do
    include FeaturesHelper
    it "Admi can see all categories" do
    admin = User.create(username: "adminor",
                        password: "password",
                        role: 1)

    admin_login

    visit admin_categories_path

    click_on "Create New Category"

    expect(page).to have_content "All Categories"
  end
end
