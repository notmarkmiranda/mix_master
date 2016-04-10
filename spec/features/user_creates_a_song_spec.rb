require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they see the page for the individual song" do
    artist = create(:artist)
    song_title = "One love"

    visit artist_path(artist)
    click_on "New song"

    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "the data they submitted is invalid" do
    scenario "they get an error message if the title is blank" do
      artist = create(:artist)

      visit artist_path(artist)
      click_on "New song"
      click_on "Create Song"
      expect(page).to have_content "Title cannot be blank"
    end
  end
end
