require "rails_helper"

  RSpec.describe 'logged in admin sees categories index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path
    expect(page).to have_content "All Categories"
  end
end
