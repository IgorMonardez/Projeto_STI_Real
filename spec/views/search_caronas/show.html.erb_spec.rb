require 'rails_helper'

RSpec.describe "search_caronas/show", type: :view do
  before(:each) do
    @search_carona = assign(:search_carona, SearchCarona.create!(
      partida: "Partida",
      chegada: "Chegada",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Partida/)
    expect(rendered).to match(/Chegada/)
    expect(rendered).to match(//)
  end
end
