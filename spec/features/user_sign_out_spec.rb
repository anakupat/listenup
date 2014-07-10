require 'rails_helper'

feature "user signs out", %q{
  As a User
  I want to sign out
  So that other people can't use my account
} do

  scenario "user signs out" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    # fill_in "Email", with: user.email
    # fill_in "Password", with: user.password
    # click_on "Sign in"

    click_on "Sign Out"

    expect(page).to have_content "Signed out successfully."
  end
end
