require "rails_helper"

RSpec.describe SkillFeedback, type: :model do
  it { is_expected.to belong_to(:skill) }
  it { is_expected.to belong_to(:feedback) }
end
