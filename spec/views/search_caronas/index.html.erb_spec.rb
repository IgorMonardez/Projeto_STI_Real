require 'rails_helper'

RSpec.describe "search_caronas/index", type: :view do
  before(:each) do
    assign(:search_caronas, [
      SearchCarona.create!(
        partida: "Partida",
        chegada: "Chegada",
        user: nil
      ),
      SearchCarona.create!(
        partida: "Partida",
        chegada: "Chegada",
        user: nil
      )
    ])
  end

  it "renders a list of search_caronas" do
    render
    assert_select "tr>td", text: "Partida".to_s, count: 2
    assert_select "tr>td", text: "Chegada".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
