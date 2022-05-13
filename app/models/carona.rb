# frozen_string_literal: true

class Carona < ApplicationRecord
  has_many :points, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :points, reject_if: :all_blank, allow_destroy: true
  validates :departure, :arrival, presence: true
  validate :campu_validation

  def campu_validation
    if check_campus_on_field(departure) && check_campus_on_field(arrival)
      errors.add(:departure, 'precisa haver ao menos um campus')
    end
  end

  def check_campus_on_field(query)
    campus = Campu.where('lower(nome) = :query', query: query.downcase).limit(1)
    campus.empty?
  end
end
