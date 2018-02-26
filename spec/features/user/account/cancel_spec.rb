require "rails_helper"

RSpec.describe "Cancel Account", type: :feature do
  include_context "hr signed in"

  before do
    visit edit_user_registration_path(current_user)
  end

  it "User cancels account" do
    click_link "удалить свой аккаунт"

    expect(page).to have_content("Войти")

    fill_form(:user, current_user.attributes.slice(:email, :password))
    click_button "Войти"

    expect(page).to have_content("Неверный email или пароль.")
  end
end
