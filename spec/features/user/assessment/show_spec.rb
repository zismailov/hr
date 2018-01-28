require "rails_helper"

RSpec.feature "Show Assessment", type: :feature do
  describe "#show" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }
    let(:hr_assessment) { create :assessment, :requested_role_hr, user: hr }
    let(:middle_dev_assessment) { create :assessment, :requested_role_senior_dev, user: middle_dev }
    let!(:lead_dev) { create :user, :lead_dev }

    context "when user is hr" do
      before { login_as hr }

      scenario "hr see middle_dev's assessment" do
        visit user_assessment_path(middle_dev_assessment.user, middle_dev_assessment)

        expect(page).to have_content "Общая сумма баллов"
      end

      scenario "hr invites lead_dev to evaluate middle_dev" do
        visit user_assessment_path(middle_dev_assessment.user, middle_dev_assessment)

        select lead_dev.decorate.full_name_with_role, from: "Сотрудник"
        click_button "Пригласить"

        expect(page).to have_content(lead_dev.decorate.full_name_with_role + "Удалить")
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      scenario "middle_dev see hr's assessment" do
        visit user_assessment_path(hr_assessment.user, hr_assessment)

        expect(page).to have_content "Извините, запрошенная функция недоступна."
      end

      scenario "middle_dev see his assessment" do
        visit user_assessment_path(middle_dev_assessment.user, middle_dev_assessment)

        expect(page).to have_content "Общая сумма баллов"
      end
    end
  end
end
