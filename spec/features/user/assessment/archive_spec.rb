require "rails_helper"

RSpec.feature "Archive Assessment", type: :feature do
  describe "#create" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }
    let(:assessment) { create :assessment, :requested_role_senior_dev, user: middle_dev }

    context "when user is hr" do
      before { login_as hr }

      scenario "hr archives assessment" do
        visit user_assessments_path(assessment.user)

        click_link "Архивировать"

        expect(page).not_to have_content "Архивировать"
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      scenario "middle_dev archives assessment" do
        visit user_assessments_path(assessment.user)

        expect(page).not_to have_content "Архивировать"
      end
    end
  end
end
