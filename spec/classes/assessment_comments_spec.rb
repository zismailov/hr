require "rails_helper"

describe AssessmentComments do
  let(:middle_dev) { create :user, :middle_dev }
  let(:senior_dev_1) { create :user, :senior_dev }
  let(:senior_dev_2) { create :user, :senior_dev }
  let(:assessment) { create :assessment, :requested_role_senior_dev, user: middle_dev }
  let(:feedback_1) { create :feedback, assessment: assessment, user: senior_dev_1 }
  let(:feedback_2) { create :feedback, assessment: assessment, user: senior_dev_2 }
  let(:skill_1) { create :skill, :senior_dev_skill, department: assessment.user.department }
  let(:skill_2) { create :skill, :senior_dev_skill, department: assessment.user.department }
  let(:comments) { described_class.new(assessment).results }

  context "when some comments are empty" do
    before do
      create(:skill_feedback, skill: skill_1, feedback: feedback_1, comment: "Первый коммент к первому скиллу")
      create(:skill_feedback, skill: skill_2, feedback: feedback_1, comment: "")
      create(:skill_feedback, skill: skill_1, feedback: feedback_2, comment: "")
      create(:skill_feedback, skill: skill_2, feedback: feedback_2, comment: "Второй коммент ко второму скиллу")
    end

    it "returns right total_sum" do
      expect(comments[:head]).to eq([feedback_1.user.full_name, feedback_2.user.full_name])
    end

    it "returns right skill_statistic" do
      expect(comments[:body]).to contain_exactly(
        [skill_1.title, skill_1.id, "Первый коммент к первому скиллу", "Нет отзыва"],
        [skill_2.title, skill_2.id, "Нет отзыва", "Второй коммент ко второму скиллу"]
      )
    end
  end

  context "when comments are not empty" do
    before do
      create(:skill_feedback, skill: skill_1, feedback: feedback_1, comment: "Первый коммент к первому скиллу")
      create(:skill_feedback, skill: skill_2, feedback: feedback_1, comment: "Первый коммент ко второму скиллу")
      create(:skill_feedback, skill: skill_1, feedback: feedback_2, comment: "Второй коммент к первому скиллу")
      create(:skill_feedback, skill: skill_2, feedback: feedback_2, comment: "Второй коммент ко второму скиллу")
    end

    it "returns right total_sum" do
      expect(comments[:head]).to eq([feedback_1.user.full_name, feedback_2.user.full_name])
    end

    it "returns right skill_statistic" do
      expect(comments[:body]).to contain_exactly(
        [skill_1.title, skill_1.id, "Первый коммент к первому скиллу", "Второй коммент к первому скиллу"],
        [skill_2.title, skill_2.id, "Первый коммент ко второму скиллу", "Второй коммент ко второму скиллу"]
      )
    end
  end
end
