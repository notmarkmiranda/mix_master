class Song < ActiveRecord::Base
  validates :title, presence: { message: "Title cannot be blank"}
  default_scope { order 'title'}
  belongs_to :artist
end
