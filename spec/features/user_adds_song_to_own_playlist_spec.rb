require 'rails_helper'

feature "user searches song and adds to their own playlist", %q{
  As a User
  I want to search for songs and add to my playlist
} do

  # Acceptance Criteria
  #
  # - I must search for a song or artist name
  # - I am redirected to search results page
  # - I see Spotify iframes of potenial songs that match my search
  # - I select song and add to my playlist

  scenario "user searches for song and adds to their own playlist" do
    visit root_path
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    Friendship.create(user_id: user1.id, friend_id: user2.id)

    sign_in_as(user1)


    fill_in "song, artist, album..", with: "Elton John"
    click_on "search!"

    within('.song-1') do
     click_on "add to my playlist"
    end

    expect(page).to have_content user1.username
    expect(page).to have_content "added by: #{user1.username}"
  end
end
