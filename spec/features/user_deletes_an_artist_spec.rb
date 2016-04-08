require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "they delete an artist" do
    artist_name = "Childish Gambinoo"
    artist_image_path = "https://a1-images.myspacecdn.com/images03/25/8b609048c0694f03a2c75e7ea345f21f/300x300.jpg"
    Artist.create(name: artist_name, image_path: artist_image_path)

    visit artists_path

    click_on("Childish Gambinoo")
    click_on "Delete"

    expect(current_path).to eq artists_path
    expect(page).not_to have_content "Childish Gambinoo"
  end
end
