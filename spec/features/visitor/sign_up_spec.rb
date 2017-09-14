require "rails_helper"

RSpec.feature "Sign Up", type: :feature do
  let(:user_attributes) { attributes_for(:user, :hr).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by email: user_attributes[:email] }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    click_button "Зарегистрироваться"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Инструкции по подтверждению учётной записи")
    expect(current_email).to have_body_text(registered_user.full_name)

    visit_in_email("Подтвердить мой аккаунт")

    expect(page).to have_content("Ваш аккаунт подтверждён.")
    expect(page).to have_text(registered_user.full_name)
  end
end
