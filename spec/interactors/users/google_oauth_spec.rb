require "rails_helper"

describe Users::GoogleOauth do
  describe ".call" do
    let(:user) { described_class.call(data: access_token.info).user }

    let(:access_token) do
      OmniAuth::AuthHash.new(
        info: {
          name: "John Doe",
          email: "john@company_name.com",
          image: "/spec/images/default_avatar.png"
        }
      )
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
