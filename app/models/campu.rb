class Campu < ApplicationRecord
  has_many :carona
  validates :address, presence: true
  validates :nome, presence: true
  validates :numero, presence: true, numericality: true
  validates :bairro, presence: true
  validates :cidade, presence: true
  validates :cep, presence: true, numericality: true
end
