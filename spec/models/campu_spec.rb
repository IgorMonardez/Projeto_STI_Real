# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campu, type: :model do
  context 'Cenário 1 - Inclusão de' do
    it 'Campus com sucesso' do
      campus = build(:campu)
      expect(campus).to be_valid
    end
  end
  context 'Cenário 2 - Inclusão de campus sem o preenchimento de campos obrigatórios' do
    it 'Endereço null' do
      campus = build(:campu, address: nil)
      expect(campus.valid?).to be(false)
    end
    it 'Nome null' do
      campus = build(:campu, nome: nil)
      expect(campus.valid?).to be(false)
    end
    it 'Numero null' do
      campus = build(:campu, numero: nil)
      expect(campus.valid?).to be(false)
    end
    it 'Bairro null' do
      campus = build(:campu, bairro: nil)
      expect(campus.valid?).to be(false)
    end
    it 'Cidade null' do
      campus = build(:campu, cidade: nil)
      expect(campus.valid?).to be(false)
    end
    it 'CEP null' do
      campus = build(:campu, cep: nil)
      expect(campus.valid?).to be(false)
    end
  end
  context 'Cenário 3 - Inclusão de ' do
    it 'Texto no CEP' do
      campus = build(:campu, cep: Faker::Address.name)
      expect(campus.valid?).to be(false)
    end
    it 'Texto no Numero' do
      campus = build(:campu, numero:  Faker::Address.name )
      expect(campus.valid?).to be(false)
    end
  end
end
