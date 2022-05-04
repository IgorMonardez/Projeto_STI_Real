require 'rails_helper'
require 'faker'

RSpec.describe Campu, type: :model do
  it '#Address' do
    campu = create(:Campu, address:Faker::Address.street_name, )
    expect(campu).to eq(Faker::Address.street_name)
  end




end
