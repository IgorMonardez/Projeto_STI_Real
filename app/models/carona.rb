# frozen_string_literal: true

class Carona < ApplicationRecord
  has_many :points, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :points
end
