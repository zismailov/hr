require "rails_helper"

RSpec.describe Feedback, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:assessment) }
  it { is_expected.to have_many(:skill_feedbacks) }

  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :assessment }
end
