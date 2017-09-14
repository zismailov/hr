require "rails_helper"

RSpec.feature "Update Account", type: :feature do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, :edit, full_name: "New Name")
    click_on "Сохранить"

    expect(page).to have_content("New Name")
  end

  scenario "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Сохранить"

    expect(page).to have_content("пароли не совпадают")
  end
end
