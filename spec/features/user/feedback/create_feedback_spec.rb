require "rails_helper"

RSpec.describe "Create Feedback", type: :feature do
  describe "#create" do
    include_context "current user signed in"

    let(:middle_dev) { create :user, :middle_dev }
    let(:assessment) { create :assessment, :requested_role_senior_dev, user: middle_dev }

    before do
      create :invite, user: current_user, assessment: assessment
      5.times { create :skill, :senior_dev_skill, department: assessment.user.department }
    end

    it "user creates feedback" do
      visit invites_path

      click_link "Создать отзыв"
      5.times do |n|
        fill_in "feedback[skill_feedbacks_attributes][#{n}][comment]", with: "comment"
        choose "feedback[skill_feedbacks_attributes][#{n}][score]"
      end
      click_button "Сохранить"

      expect(page).to have_content "Отзыв был успешно создан"
    end
  end
end
