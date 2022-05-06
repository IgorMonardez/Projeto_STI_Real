require 'rails_helper'

RSpec.describe "search_caronas/new", type: :view do
  before(:each) do
    assign(:search_carona, SearchCarona.new(
      partida: "MyString",
      chegada: "MyString",
      user: nil
    ))
  end

  it "renders new search_carona form" do
    render

    assert_select "form[action=?][method=?]", search_caronas_path, "post" do

      assert_select "input[name=?]", "search_carona[partida]"

      assert_select "input[name=?]", "search_carona[chegada]"

      assert_select "input[name=?]", "search_carona[user_id]"
    end
  end
end
