require 'rails_helper'

RSpec.describe "campus/show", type: :view do
  before(:each) do
    @campu = assign(:campu, Campu.create!(
      address: "Address",
      nome: "Nome",
      numero: 2,
      bairro: "Bairro",
      cidade: "Cidade",
      cep: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(/3/)
  end
end
