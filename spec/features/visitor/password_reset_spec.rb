require "rails_helper"

RSpec.feature "Password Reset", type: :feature do
  let(:new_password) { "qwe123" }
  let(:user) { create :user, :hr }

  def update_password
    fill_in "Пароль", with: new_password
    fill_in "Повторите пароль", with: new_password
    click_button "Сменить пароль"
  end

  scenario "Visitor resets his password" do
    visit new_user_password_path

    fill_in "Email", with: user.email
    click_button "Отправить инструкции по сбросу пароля"

    open_email(user.email)

    expect(current_email).to have_subject("Инструкции по сбросу пароля")
    expect(current_email).to have_body_text(user.full_name)

    visit_in_email("Изменить пароль")
    update_password

    expect(page).to have_content("Ваш пароль изменён.")
  end
end
