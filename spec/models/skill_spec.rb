require "rails_helper"

describe Skill do
  it { is_expected.to validate_presence_of :description }
end
