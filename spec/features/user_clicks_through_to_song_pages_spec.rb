require 'rails_helper'

RSpec.feature "User clicks through to song pages" do
  scenario "they see alphabetized song titles" do
    artist = create(:artist)
    song_one = artist.songs.create(title: "One Love")
    song_two = artist.songs.create(title: "No Woman, No Cry")
    visit artist_path(artist)
    click_on "View songs"
    expect(page).to have_selector("ul li:nth-child(2)", text: song_one.title)
    expect(page).to have_selector("ul li:nth-child(1)", text: song_two.title)
    expect(page).to have_link song_one.title
    expect(page).to have_link song_two.title
    click_on song_one.title
    expect(current_path).to eq song_path(song_one)
  end
end
