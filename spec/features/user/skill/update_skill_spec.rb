require "rails_helper"

RSpec.feature "Update Skill", type: :feature do
  include_context "current user signed in"

  let(:skill) { create :skill }

  scenario "User creates skill" do
    visit edit_skill_path(skill)

    ill_in "skill[description]", with: "Новый навык"
    click_button "Сохранить"

    expect(page).to have_content "Новый навык"
  end
end
