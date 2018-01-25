require "rails_helper"

describe Skill do
  describe "associations" do
    it { should belong_to(:department) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :role }
    it { is_expected.to validate_presence_of :description }
  end
end
