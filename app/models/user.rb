class User < ApplicationRecord
  validates_numericality_of :iduff
  validates :name, presence: true
  validates :iduff, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :caronas
end
