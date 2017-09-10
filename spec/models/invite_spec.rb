require "rails_helper"

RSpec.describe Invite, type: :model do
  describe Invite do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:assessment) }
  end
end
