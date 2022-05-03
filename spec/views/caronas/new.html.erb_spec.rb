require 'rails_helper'

RSpec.describe "caronas/new", type: :view do
  before(:each) do
    assign(:carona, Carona.new(
      preco: 1,
      qtd_passageiros: 1,
      departure: "MyString",
      arrival: "MyString"
    ))
  end

  it "renders new carona form" do
    render

    assert_select "form[action=?][method=?]", caronas_path, "post" do

      assert_select "input[name=?]", "carona[preco]"

      assert_select "input[name=?]", "carona[qtd_passageiros]"

      assert_select "input[name=?]", "carona[departure]"

      assert_select "input[name=?]", "carona[arrival]"
    end
  end
end
