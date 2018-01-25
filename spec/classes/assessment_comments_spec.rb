require "rails_helper"

describe AssessmentComments do
  let(:assessment) { create :assessment, :apply_for_senior_dev }
  let(:feedback_1) { create :feedback, assessment: assessment }
  let(:feedback_2) { create :feedback, assessment: assessment }
  let(:skill_1) { create :skill, :senior_dev_skill, department: assessment.user.department }
  let(:skill_2) { create :skill, :senior_dev_skill, department: assessment.user.department }
  let(:comments) { described_class.new(assessment).results }

  before do
    create(:skill_feedback, skill: skill_1, feedback: feedback_1, comment: "Первый коммент к первому скиллу")
    create(:skill_feedback, skill: skill_2, feedback: feedback_1, comment: "Первый коммент ко второму скиллу")
    create(:skill_feedback, skill: skill_1, feedback: feedback_2, comment: "Второй коммент к первому скиллу")
    create(:skill_feedback, skill: skill_2, feedback: feedback_2, comment: "Второй коммент ко второму скиллу")
  end

  it "returns right total_avg_sum" do
    expect(comments[:head]).to eq([feedback_1.user.full_name, feedback_2.user.full_name])
  end

  it "returns right skill_statistic" do
    expect(comments[:body]).to contain_exactly(
      [skill_1.description, "Первый коммент к первому скиллу", "Второй коммент к первому скиллу"],
      [skill_2.description, "Первый коммент ко второму скиллу", "Второй коммент ко второму скиллу"]
    )
  end
end
