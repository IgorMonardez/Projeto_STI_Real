require 'rails_helper'

RSpec.describe "caronas/edit", type: :view do
  before(:each) do
    @carona = assign(:carona, Carona.create!(
      preco: 1,
      qtd_passageiros: 1,
      departure: "MyString",
      arrival: "MyString"
    ))
  end

  it "renders the edit carona form" do
    render

    assert_select "form[action=?][method=?]", carona_path(@carona), "post" do

      assert_select "input[name=?]", "carona[preco]"

      assert_select "input[name=?]", "carona[qtd_passageiros]"

      assert_select "input[name=?]", "carona[departure]"

      assert_select "input[name=?]", "carona[arrival]"
    end
  end
end
