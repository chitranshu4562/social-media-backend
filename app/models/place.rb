class Place < ApplicationRecord
  validates :title, presence: true
  validates :imageLink, presence: true
end
