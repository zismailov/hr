require "rails_helper"

RSpec.describe SkillFeedback, type: :model do
  it { is_expected.to belong_to(:skill) }
  it { is_expected.to belong_to(:feedback) }

  it { is_expected.to validate_presence_of :score }
  it { is_expected.to validate_presence_of :comment }
  it { is_expected.to validate_presence_of :skill }
end
