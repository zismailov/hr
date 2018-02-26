require "rails_helper"

RSpec.describe "Update", type: :feature do
  describe "#update" do
    include_context "hr signed in"

    let(:middle_dev) { create :user, :middle_dev }
    let(:assessment) { create :assessment, :requested_role_senior_dev, user: middle_dev }
    let(:feedback) { create :feedback_with_skill_feedbacks, assessment: assessment, user: current_user }

    before do
      create :invite, user: current_user, feedback: feedback, assessment: assessment
    end

    it "user updates feedback" do
      visit invites_path

      click_link "Изменить"

      fill_in "feedback[skill_feedbacks_attributes][0][comment]", with: "Новый комментарий"
      choose("feedback[skill_feedbacks_attributes][0][score]")

      click_button "Сохранить"

      expect(page).to have_content "Отзыв был успешно обновлен"
      expect(page).to have_content "Новый комментарий"
    end
  end
end
