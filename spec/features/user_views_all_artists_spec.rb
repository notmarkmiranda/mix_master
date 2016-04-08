require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a page that shows all artists" do
    artist_one_name = "Bob Marley"
    artist_one_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_two_name = "Childish Gambino"
    artist_two_image_path = "https://a1-images.myspacecdn.com/images03/25/8b609048c0694f03a2c75e7ea345f21f/300x300.jpg"
    Artist.create(name: artist_one_name, image_path: artist_one_image_path)
    Artist.create(name: artist_two_name, image_path: artist_two_image_path)

    visit artists_path

    expect(page).to have_content artist_one_name
    expect(page).to have_content artist_two_name
    expect(page).to have_link "Bob Marley"
    expect(page).to have_link "Childish Gambino"

  end
end
