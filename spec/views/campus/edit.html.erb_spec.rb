require 'rails_helper'
require 'faker'

RSpec.describe "campus/edit", type: :view do
  before(:each) do
    @campu = assign(:campu, Campu.create!(
      address: Faker::Address.street_name,
      nome: Faker::University.name,
      numero: Faker::Address.building_number,
      bairro: Faker::Address.community,
      cidade: Faker::Address.city,
      cep: Faker::Address.postcode
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
