class User < ApplicationRecord
  has_many :caronas
  has_many :admin
  has_secure_password
  validates :login,presence: true, length: { maximum: 11 }
end
