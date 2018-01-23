require "rails_helper"

RSpec.describe Invite, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:assessment) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :assessment }
  end
end
