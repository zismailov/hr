require "rails_helper"

RSpec.describe "Sign Out", type: :feature do
  include_context "hr signed in"

  it "User signs out" do
    visit "/"
    click_link "Выйти"

    expect(page).to have_content "Войти"
  end
end
