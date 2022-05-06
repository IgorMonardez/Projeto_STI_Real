# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'é valido com email, nome, iduff e senha encriptada' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'invalido no caso de estar' do
    it 'sem email ' do
      user = create(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'sem nome ' do
      user = create(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it 'sem iduff' do
      user = create(:user, iduff: nil)
      user.valid?
      expect(user.errors[:iduff]).to include("can't be blank")
    end

    it 'sem senha' do
      user = create(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end
  end
end
