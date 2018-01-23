require "rails_helper"

RSpec.describe Assessment, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:invites) }
    it { should have_many(:feedbacks) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :date }
  end
end
