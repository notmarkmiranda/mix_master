require 'rails_helper'

RSpec.feature "" do
  scenario "" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = Playlist.create(name: "Mark's Playlist")
    PlaylistSong.create(playlist_id: playlist.id, song_id: song_one.id)
    PlaylistSong.create(playlist_id: playlist.id, song_id: song_three.id)
    new_playlist_name = "Mark's Super Cool Playlist"
    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: new_playlist_name
    check("song-#{song_two.id}")
    uncheck("song-#{song_three.id}")
    click_on "Update Playlist"
    expect(page).to have_content new_playlist_name
    expect(page).to have_content song_two.title
    expect(page).to_not have_content song_three.title
  end
end
