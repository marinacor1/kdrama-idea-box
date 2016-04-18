require "rails_helper"

  RSpec.describe "Logged in admin sees categories index" do
    include Capybara::DSL
    it "Admin can see all categories" do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    # ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path
    save_and_open_page
    
    expect(page).to have_content "All Categories"
  end
end
