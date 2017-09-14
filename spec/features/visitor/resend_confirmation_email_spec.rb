require "rails_helper"

RSpec.feature "Resend Confirmation Email", type: :feature do
  let(:user) { create :user, :hr, :not_confirmed }

  scenario "Visitor resends email confirmation instructions" do
    visit new_user_confirmation_path

    fill_in "Email", with: user.email
    click_button "Отправить инструкции повторно"

    open_email(user.email)

    expect(current_email).to have_subject("Инструкции по подтверждению учётной записи")
    expect(current_email).to have_body_text(user.full_name)
  end
end
