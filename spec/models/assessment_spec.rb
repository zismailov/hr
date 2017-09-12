require "rails_helper"

RSpec.describe Assessment, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:invites) }
  it { is_expected.to have_many(:feedbacks) }
end
