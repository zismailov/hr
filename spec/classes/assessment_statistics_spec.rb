require "rails_helper"

describe AssessmentStatistics do
  let!(:assessment) { create :assessment }
  let(:feedback_1) { create :feedback, assessment: assessment }
  let(:feedback_2) { create :feedback, assessment: assessment }
  let(:skill_1) { create :skill }
  let(:skill_2) { create :skill }
  let(:statistic) { described_class.new(assessment).results }

  before do
    create(:skill_feedback, skill: skill_1, feedback: feedback_1, score: 3)
    create(:skill_feedback, skill: skill_2, feedback: feedback_1, score: 5)
    create(:skill_feedback, skill: skill_1, feedback: feedback_2, score: 4)
    create(:skill_feedback, skill: skill_2, feedback: feedback_2, score: 5)
  end

  it "returns right total_sum" do
    expect(statistic[:total_avg_sum]).to eq(8.5)
  end

  it "returns right skill_statistic" do
    expect(statistic[:skill_statistic]).to contain_exactly(
      [skill_1.description, skill_1.id, 3.5, 7], [skill_2.description, skill_2.id, 5.0, 10]
    )
  end
end
