require 'rails_helper'

RSpec.feature "user can edit an artist" do
  scenario "they edit an artist" do
    artist_name = "Childish Gambinoo"
    artist_image_path = "https://a1-images.myspacecdn.com/images03/25/8b609048c0694f03a2c75e7ea345f21f/300x300.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artists_path
    click_on "Childish Gambinoo"
    click_on "Edit"
    fill_in "artist_name", with: "Childish Gambino"
    click_on "Update Artist"

    expect(current_path).to eq artist_path(artist)
    expect(page).to have_content "Childish Gambino"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
