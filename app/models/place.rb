class Place < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :image_link, presence: true
  validates :place_tag, presence: true
  belongs_to :user
end
