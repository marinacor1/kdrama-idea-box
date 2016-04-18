require "rails_helper"

  RSpec.describe "Logged in admin sees categories index" do
    include Capybara::DSL
    xit "Admin can see all categories" do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.stubs(:current_user).returns(admin)

  # before(:each) do
  #    ApplicationController.any_instance.stub(:current_user).and_return(admin)
  # end
  # controller = ApplicationController.new
    # allow(controller).to receive(:current_user).and_return(admin)
    visit admin_categories_path

    expect(page).to have_content "All Categories"
  end
end
