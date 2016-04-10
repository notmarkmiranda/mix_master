require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they see the songs updated name" do
    artist = create(:artist)
    song = create(:song)
    song = artist.songs.create(title: "Two Loves")
    new_title = "One Love"
    visit song_path(song)
    click_on "Edit"
    fill_in "song_title", with: new_title
    click_on "Update Song"
    expect(current_path).to eq song_path(song)
    expect(page).to have_content new_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
