require 'rails_helper'

RSpec.feature "User goes from song index to song page" do
  scenario "they see the individual song page" do
  song_one, song_two = create_list(:song, 2)
  visit songs_path
  expect(page).to have_selector("ul li:nth-child(1)", text: song_two.title)
  expect(page).to have_selector("ul li:nth-child(2)", text: song_one.title)
  expect(page).to have_link song_one.title, href: song_path(song_one)
  expect(page).to have_link song_two.title, href: song_path(song_two)
  end
end
