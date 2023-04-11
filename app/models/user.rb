class User < ApplicationRecord
  has_many :places
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
