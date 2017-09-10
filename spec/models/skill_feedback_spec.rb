require "rails_helper"

RSpec.describe SkillFeedback, type: :model do
  describe SkillFeedback do
    it { is_expected.to belong_to(:skill) }
    it { is_expected.to belong_to(:feedback) }
  end
end
