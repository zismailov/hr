require "rails_helper"

RSpec.feature "Cancel Account", type: :feature do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User cancels account" do
    click_link "Cancel my account"

    expect(page).to have_content("Sign in")

    click_link "Sign in"
    fill_form(:user, current_user.attributes.slice(:email, :password))
    click_button "Sign in"

    expect(page).to have_content("Invalid email or password.")
  end
end
