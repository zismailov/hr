require "rails_helper"

RSpec.describe Feedback, type: :model do
  describe Feedback do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:assessment) }
    it { is_expected.to have_many(:skill_feedbacks) }
  end
end
