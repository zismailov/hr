require "rails_helper"

RSpec.feature "Archive Skill", type: :feature do
  include_context "current user signed in"

  let(:skill) { create :skill }

  scenario "User arhives skill" do
    visit skills_path(skill)

    click_link "Архивировать"

    expect(page).not_to have_content(skill.description)
  end
end
