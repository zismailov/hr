require "rails_helper"

feature "Show" do
  describe "#show" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }

    context "when user is hr" do
      before { login_as hr }

      it "checks hr can edit his role" do
        visit user_path(hr)

        expect(page).to have_content("Изменить должность")
      end

      it "checks hr can edit other users role" do
        visit user_path(middle_dev)

        expect(page).to have_content("Изменить должность")
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      it "checks middle_dev can't edit his role" do
        visit user_assessments_path(middle_dev)

        expect(page).not_to have_content("Изменить должность")
      end

      it "checks middle_dev can't edit other users role" do
        visit user_assessments_path(hr)

        expect(page).not_to have_content("Изменить должность")
      end
    end
  end
end
