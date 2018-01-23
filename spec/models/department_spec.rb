require "rails_helper"

RSpec.describe Department, type: :model do
  describe "associations" do
    it { should have_many(:users) }
    it { should have_many(:skills) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :title }
  end
end
