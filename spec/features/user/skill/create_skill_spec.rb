require "rails_helper"

RSpec.feature "Create Skill", type: :feature do
  include_context "current user signed in"

  let(:skill_attributes) { attributes_for(:skill).slice(:title, :description) }

  scenario "User creates skill" do
    visit skills_path

    click_link "Добавить навык"
    fill_in "skill[title]", with: skill_attributes[:title]
    fill_in "skill[description]", with: skill_attributes[:description]
    click_button "Сохранить"

    expect(page).to have_content "Навык был успешно создан."
  end
end
