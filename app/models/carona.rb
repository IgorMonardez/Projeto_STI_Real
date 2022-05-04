class Carona < ApplicationRecord
  belongs_to :users
  has_many :points
end
