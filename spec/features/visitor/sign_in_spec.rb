require "rails_helper"

RSpec.feature "Sign In", type: :feature do
  let(:user) { create :user, :hr }
  let(:unconfirmed_user) { create :user, :hr, :not_confirmed }

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Войти"
  end

  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("Выйти")
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Войти")
    expect(page).to have_content("Неверный email или пароль")
  end

  scenario "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content("Вам необходимо подтвердить ваш аккаунт, прежде чем продолжить.")
  end
end
