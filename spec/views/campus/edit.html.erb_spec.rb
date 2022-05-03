require 'rails_helper'

RSpec.describe "campus/edit", type: :view do
  before(:each) do
    @campu = assign(:campu, Campu.create!(
      address: "MyString",
      nome: "MyString",
      numero: 1,
      bairro: "MyString",
      cidade: "MyString",
      cep: 1
    ))
  end

  it "renders the edit campu form" do
    render

    assert_select "form[action=?][method=?]", campu_path(@campu), "post" do

      assert_select "input[name=?]", "campu[address]"

      assert_select "input[name=?]", "campu[nome]"

      assert_select "input[name=?]", "campu[numero]"

      assert_select "input[name=?]", "campu[bairro]"

      assert_select "input[name=?]", "campu[cidade]"

      assert_select "input[name=?]", "campu[cep]"
    end
  end
end
