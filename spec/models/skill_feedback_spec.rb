require "rails_helper"

RSpec.describe SkillFeedback, type: :model do
  describe "associations" do
    it { should belong_to(:skill) }
    it { should belong_to(:feedback) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :skill }
  end
end
