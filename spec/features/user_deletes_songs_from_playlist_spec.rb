require 'rails_helper'

feature "user deletes any song that has been added to their playlist", %q{
  As a User
  I want to delete songs from my playlist that I no longer want
} do

  # Acceptance Criteria
  #
  # - I must be signed in
  # - I can delete any songs that have been added to my playlist

  scenario "user deletes song from their playlist" do

    song = FactoryGirl.create(:song)
    visit "/users/#{song.added_by}"

    expect(page).to have_content 'hello test'

  end
end
