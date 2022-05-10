# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campu, type: :model do
  context 'Campus válido' do
    it 'atributos aleatórios' do
      campus = build(:campu)
      expect(campus).to be_valid
    end
  end

  context 'Campus inválido quando' do
    it 'Endereço null' do
      campus = build(:campu, address: nil)
      campus.valid?
      expect(campus.errors).to include()
    end
    pending 'Nome null' do
    end
    pending 'Numero null' do
    end
    pending 'Bairro null' do
    end
    pending 'Cidade null' do
    end
    pending 'CEP null' do
    end
  end
end
