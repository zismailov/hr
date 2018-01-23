require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should belong_to(:department) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :full_name }
  end

  describe "creates or updates itself from an oauth hash" do
    let(:user) { described_class.first }

    before do
      access_token = OmniAuth::AuthHash.new(
        provider: "google_oauth2",
        uid: "123456789",
        info: {
          name: "John Doe",
          email: "john@company_name.com",
          image: "/spec/images/default_avatar.png"
        }
      )
      described_class.from_omniauth(access_token)
    end

    it "saves email" do
      expect(user.email).to eq("john@company_name.com")
    end

    it "saves full name" do
      expect(user.full_name).to eq("John Doe")
    end

    it "saves profile image" do
      expect(user.profile_image).to eq("/spec/images/default_avatar.png")
    end
  end
end
