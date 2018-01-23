require "rails_helper"

RSpec.describe Feedback, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:assessment) }
    it { should have_many(:skill_feedbacks) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :assessment }
  end
end
