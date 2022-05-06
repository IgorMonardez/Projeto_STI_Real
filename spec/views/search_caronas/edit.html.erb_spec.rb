require 'rails_helper'

RSpec.describe "search_caronas/edit", type: :view do
  before(:each) do
    @search_carona = assign(:search_carona, SearchCarona.create!(
      partida: "MyString",
      chegada: "MyString",
      user: nil
    ))
  end

  it "renders the edit search_carona form" do
    render

    assert_select "form[action=?][method=?]", search_carona_path(@search_carona), "post" do

      assert_select "input[name=?]", "search_carona[partida]"

      assert_select "input[name=?]", "search_carona[chegada]"

      assert_select "input[name=?]", "search_carona[user_id]"
    end
  end
end
