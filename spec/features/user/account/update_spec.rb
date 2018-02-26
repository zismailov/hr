require "rails_helper"

RSpec.describe "Update Account", type: :feature do
  include_context "hr signed in"

  before do
    visit edit_user_registration_path(current_user)
  end

  it "User updates account with valid data" do
    fill_form(:user, :edit, full_name: "New Name")
    click_on "Сохранить"

    expect(page).to have_content("New Name")
  end

  it "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Сохранить"

    expect(page).to have_content("пароли не совпадают")
  end
end
