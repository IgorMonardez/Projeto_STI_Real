require 'rails_helper'
require 'faker'
require 'factory_bot'

RSpec.describe Admin, type: :model do
  it 'é valido com email, nome, iduff e senha encriptada' do
    admins = create(:admin)
    expect(admins).to be_valid
  end

  context 'invalido no caso de estar' do
    it 'sem email ' do
      admin = create(:admin, email: nil)
      admin.valid?
      expect(admin.errors[:email]).to include("can't be blank")
    end
    it 'sem nome ' do
      admin = create(:admin, name: nil)
      admin.valid?
      expect(admin.errors[:name]).to include("can't be blank")
    end
    it 'sem iduff' do
      admin = create(:admin, iduff: nil)
      admin.valid?
      expect(admin.errors[:iduff]).to include("can't be blank")
    end

    it 'sem senha' do
      admin = create(:admin, encrypted_password: nil)
      admin.valid?
      expect(admin.errors[:encrypted_password]).to include("can't be blank")
    end
  end

end
