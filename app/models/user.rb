class User < ApplicationRecord
  has_many :places, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
end
