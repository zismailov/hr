require "rails_helper"

RSpec.describe "Sign In", type: :feature do
  let(:user) { create :user, :hr }
  let(:unconfirmed_user) { create :user, :hr, :not_confirmed }

  def sign_in(email, password)
    visit new_user_session_path

    fill_in(:user_email, with: email)
    fill_in(:user_password, with: password)

    click_button "Log in"
  end

  it "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("Выйти")
  end

  it "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Войти")
    expect(page).to have_content("Неверный email или пароль")
  end

  it "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content("Вам необходимо подтвердить ваш аккаунт, прежде чем продолжить.")
  end

  it "Visitor signs in via Google" do
    stub_omniauth
    visit new_user_session_path

    click_link "Войти с помощью Google"

    expect(page).to have_link("Выйти")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: "google_oauth2",
      uid: "123 456 789",
      info: {
        name: "John Doe",
        email: "john@company_name.com",
        image: "/spec/images/default_avatar.png"
      }
    )
  end
end
