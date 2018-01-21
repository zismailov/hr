require "rails_helper"

RSpec.feature "Edit Assessment", type: :feature do
  describe "#edit" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }
    let(:assessment) { create :assessment, :apply_for_senior_dev, user: middle_dev }

    context "when user is hr" do
      before { login_as hr }

      scenario "hr changes date of assessment" do
        visit edit_user_assessment_path(assessment.user, assessment)

        select Time.zone.tomorrow.strftime("%-d"), from: "assessment_date_3i"
        select Time.zone.tomorrow.strftime("%B"), from: "assessment_date_2i"
        select Time.zone.tomorrow.strftime("%Y"), from: "assessment_date_1i"
        click_button "Запланировать оценку"

        expect(page).to have_content(Time.zone.tomorrow.strftime("%e %B %Y"))
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      scenario "middle_dev changes date of assessment" do
        visit edit_user_assessment_path(assessment.user, assessment)

        expect(page).to have_content("Извините, запрошенная функция недоступна.")
      end
    end
  end
end
