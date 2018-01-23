require "rails_helper"

RSpec.feature "Index Assessment", type: :feature do
  describe "#index" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }

    context "when user is hr" do
      before { login_as hr }

      it "checks hr can see his assessments" do
        visit user_assessments_path(hr)

        expect(page).to have_content "Запланировать новую оценку"
      end

      it "checks hr can see other users assessments" do
        visit user_assessments_path(middle_dev)

        expect(page).to have_content "Запланировать новую оценку"
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      it "checks middle_dev can't see other users assessments" do
        visit user_assessments_path(hr)

        expect(page).to have_content "Извините, запрошенная функция недоступна."
      end

      it "checks middle_dev can see his assessments" do
        visit user_assessments_path(middle_dev)

        expect(page).not_to have_content(hr.full_name)
      end
    end
  end
end
