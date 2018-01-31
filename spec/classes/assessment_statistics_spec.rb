require "rails_helper"

describe AssessmentStatistics do
  let(:middle_dev) { create :user, :middle_dev }
  let(:senior_dev_1) { create :user, :senior_dev }
  let(:senior_dev_2) { create :user, :senior_dev }
  let(:assessment) { create :assessment, :requested_role_senior_dev, user: middle_dev }
  let(:feedback_1) { create :feedback, assessment: assessment, user: senior_dev_1 }
  let(:feedback_2) { create :feedback, assessment: assessment, user: senior_dev_2 }
  let(:skill_1) { create :skill, :senior_dev_skill, department: assessment.user.department }
  let(:skill_2) { create :skill, :senior_dev_skill, department: assessment.user.department }
  let(:statistic) { described_class.new(assessment).results }

  context "when some scores are empty" do
    before do
      create(:skill_feedback, skill: skill_1, feedback: feedback_1, score: 3)
      create(:skill_feedback, skill: skill_2, feedback: feedback_1, score: nil)
      create(:skill_feedback, skill: skill_1, feedback: feedback_2, score: 4)
      create(:skill_feedback, skill: skill_2, feedback: feedback_2, score: 5)
    end

    it "returns right total_avg_sum" do
      expect(statistic[:total_avg_sum]).to eq(8.5)
    end

    it "returns right skill_statistic" do
      expect(statistic[:skill_statistic]).to contain_exactly(
        [skill_1.title, skill_1.id, 3.5, 7], [skill_2.title, skill_2.id, 5.0, 5]
      )
    end
  end

  context "when scores are not empty" do
    before do
      create(:skill_feedback, skill: skill_1, feedback: feedback_1, score: 3)
      create(:skill_feedback, skill: skill_2, feedback: feedback_1, score: 5)
      create(:skill_feedback, skill: skill_1, feedback: feedback_2, score: 4)
      create(:skill_feedback, skill: skill_2, feedback: feedback_2, score: 5)
    end

    it "returns right total_avg_sum" do
      expect(statistic[:total_avg_sum]).to eq(8.5)
    end

    it "returns right skill_statistic" do
      expect(statistic[:skill_statistic]).to contain_exactly(
        [skill_1.title, skill_1.id, 3.5, 7], [skill_2.title, skill_2.id, 5.0, 10]
      )
    end
  end
end
