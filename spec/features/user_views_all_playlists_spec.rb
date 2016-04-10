require 'rails_helper'

RSpec.feature "User views playlists" do
  scenario "they click through from playlist index to individual playlist" do
    play_one = Playlist.create(name: "Mark's Playlist")
    play_two = Playlist.create(name: "Holly's Playlist")
    visit playlists_path
    expect(page).to have_link play_one.name, href:playlist_path(play_one)
    expect(page).to have_link play_two.name, href:playlist_path(play_two)
  end
end
