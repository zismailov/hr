require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should belong_to(:department) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :full_name }
  end
end
