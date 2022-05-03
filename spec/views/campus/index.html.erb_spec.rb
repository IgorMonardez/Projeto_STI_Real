require 'rails_helper'

RSpec.describe "campus/index", type: :view do
  before(:each) do
    assign(:campus, [
      Campu.create!(
        address: "Address",
        nome: "Nome",
        numero: 2,
        bairro: "Bairro",
        cidade: "Cidade",
        cep: 3
      ),
      Campu.create!(
        address: "Address",
        nome: "Nome",
        numero: 2,
        bairro: "Bairro",
        cidade: "Cidade",
        cep: 3
      )
    ])
  end

  it "renders a list of campus" do
    render
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Nome".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Bairro".to_s, count: 2
    assert_select "tr>td", text: "Cidade".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
