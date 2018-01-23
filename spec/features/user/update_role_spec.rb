require "rails_helper"

feature "Update User Role" do
  describe "#update" do
    let(:hr) { create :user, :hr }
    let(:middle_dev) { create :user, :middle_dev }

    context "when user is hr" do
      before { login_as hr }

      scenario "hr changes role and level of middle_dev" do
        visit user_path(middle_dev)

        select "Lead Developer", from: "user_role"
        select "2", from: "user_level"
        click_button "Сохранить"

        expect(page).to have_content "Пользователь был успешно обновлен."
      end
    end

    context "when user is middle_dev" do
      before { login_as middle_dev }

      scenario "middle_dev changes role" do
        visit user_path(middle_dev)

        expect(page).not_to have_content "Изменить должность"
      end
    end
  end
end
