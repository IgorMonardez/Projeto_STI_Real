class Carona < ApplicationRecord
  has_many :points
  belongs_to :user
end
