require 'rails_helper'
require 'faker'

RSpec.describe "campus/new", type: :view do
  before(:each) do
    assign(:campu, Campu.new(
      address: Faker::Address.street_name,
      nome: Faker::University.name,
      numero: Faker::Number.number(digits: 3),
      bairro: Faker::Address.building_number,
      cidade: Faker::Address.city,
      cep: Fake::Address.postcode
    ))
  end

  it "renders new campu form" do
    render

    assert_select "form[action=?][method=?]", campus_path, "post" do

      assert_select "input[name=?]", "campu[address]"

      assert_select "input[name=?]", "campu[nome]"

      assert_select "input[name=?]", "campu[numero]"

      assert_select "input[name=?]", "campu[bairro]"

      assert_select "input[name=?]", "campu[cidade]"

      assert_select "input[name=?]", "campu[cep]"
    end
  end
end
