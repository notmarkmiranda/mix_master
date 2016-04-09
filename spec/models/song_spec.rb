require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title).with_message("Title cannot be blank") }
  end
end
