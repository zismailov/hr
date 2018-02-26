require "rails_helper"

RSpec.describe "Create", type: :feature do
  include_context "hr signed in"

  let(:skill_attributes) { attributes_for(:skill).slice(:title, :description) }

  it "User creates skill" do
    visit skills_path

    click_link "Добавить навык"
    fill_in "skill[title]", with: skill_attributes[:title]
    fill_in "skill[description]", with: skill_attributes[:description]
    select "Senior Developer", from: "skill[role]"
    click_button "Сохранить"

    expect(page).to have_content "Навык был успешно создан."
  end
end
