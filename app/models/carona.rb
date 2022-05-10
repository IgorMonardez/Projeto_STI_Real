class Carona < ApplicationRecord
  has_many :points, inverse_of: :carona
  belongs_to :user
  accepts_nested_attributes_for :points, reject_if: :all_blank, allow_destroy: true
end
