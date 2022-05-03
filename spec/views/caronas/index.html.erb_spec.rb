require 'rails_helper'

RSpec.describe "caronas/index", type: :view do
  before(:each) do
    assign(:caronas, [
      Carona.create!(
        preco: 2,
        qtd_passageiros: 3,
        departure: "Departure",
        arrival: "Arrival"
      ),
      Carona.create!(
        preco: 2,
        qtd_passageiros: 3,
        departure: "Departure",
        arrival: "Arrival"
      )
    ])
  end

  it "renders a list of caronas" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Departure".to_s, count: 2
    assert_select "tr>td", text: "Arrival".to_s, count: 2
  end
end
