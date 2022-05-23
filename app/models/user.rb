class User < ApplicationRecord
  validates_numericality_of :iduff
  validates :name, presence: true
  validates :iduff, presence: true
  validates :email, presence: true
end
