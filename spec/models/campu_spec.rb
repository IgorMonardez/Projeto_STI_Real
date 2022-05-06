require 'rails_helper'

RSpec.describe Campu, type: :model do
  it 'Desativar' do
    campus = create(:campu)
    expect(campus).to be_valid
  end

end
