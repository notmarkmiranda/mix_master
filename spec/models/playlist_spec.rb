require 'rails_helper'

RSpec.describe Playlist, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
  it { should have_many(:playlist_songs) }
  it { should have_many(:songs).through(:playlist_songs)}
end
