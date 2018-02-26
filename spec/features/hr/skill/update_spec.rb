require "rails_helper"

RSpec.describe "Update", type: :feature do
  include_context "hr signed in"

  let(:skill) { create :skill, :senior_dev_skill }

  it "User updates skill's description" do
    visit edit_skill_path(skill)

    fill_in "skill[title]", with: "Новый навык"
    click_button "Сохранить"

    expect(page).to have_content "Новый навык"
  end
end
