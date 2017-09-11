require "rails_helper"

describe AssessmentStatistics do
  let!(:assessment) { create :assessment }
  let!(:feedback_1) { create :feedback, assessment: assessment }
  let!(:feedback_2) { create :feedback, assessment: assessment }
  let!(:skill) { create :skill }
  let(:statistic) { described_class.new(assessment).results }

  before do
    create(:skill_feedback, skill: skill, feedback: feedback_1, score: 4)
    create(:skill_feedback, skill: skill, feedback: feedback_2, score: 5)
  end

  it "returns right total_sum" do
    expect(statistic[:total_sum]).to eq(9)
  end

  it "returns right skill_statistic" do
    expect(statistic[:skill_statistic]).to contain_exactly([skill.description, skill.id, 4.5, 9])
  end
end
