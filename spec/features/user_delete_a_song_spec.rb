require 'rails_helper'

RSpec.feature "User clicks on delete for a song" do
  scenario "they are sent back to artists song index page" do
    artist = create(:artist)
    song_one = artist.songs.create(title: "One Love")
    song_two = artist.songs.create(title: "No Woman, No Cry")
    visit artist_songs_path(artist)
    first(:link, "Delete").click
    expect(current_path).to eq artist_songs_path(artist)
    expect(page).to_not have_content "No Woman, No Cry"
  end
end
