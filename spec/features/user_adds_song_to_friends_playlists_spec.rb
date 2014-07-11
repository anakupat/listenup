require 'rails_helper'

feature "user searches song and adds to friends playlists", %q{
  As a User
  I want to search for songs to add to friends playlists for them to hear
} do

  # Acceptance Criteria
  #
  # - I must search for a song or artist name
  # - I am redirected to search results page
  # - I see Spotify iframes of potenial songs that match my search
  # - I select friends that I want to place song in their playlist

  scenario "user searches for song and adds to friends playlist" do
    visit root_path
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    Friendship.create(user_id: user1.id, friend_id: user2.id)

    sign_in_as(user1)

    fill_in "song, artist, album..", with: "Elton John"
    click_on "search!"

    # find(:css, ".song-1").set(true)

    within('.song-1') do
      check 'user_ids_'
      click_on 'add'
    end

    visit "/users/username2"

    expect(page).to have_content "username2"
    expect(page).to have_content "added by: username1"

  end
end
