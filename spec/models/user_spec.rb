require 'rails_helper'

RSpec.describe User, type: :model do
  it 'é valido com email, nome, iduff e senha encriptada' do
    users = build(:user)
    expect(users).to be_valid
  end
  it 'sem email ' do
    user = build(:user, email: nil)
    expect(user.valid?).to be_falsey
  end
  it 'sem nome ' do
    user = build(:user, name: nil)
    expect(user.valid?).to be_falsey

  end
  it 'sem iduff' do
    user = build(:user, iduff: nil)
    expect(user.valid?).to be_falsey

  end
end
