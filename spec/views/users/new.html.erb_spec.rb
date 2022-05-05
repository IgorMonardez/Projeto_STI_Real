require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      nome: "MyString",
      iduff: 1
    ))
  end

  it "renders new users form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "users[nome]"

      assert_select "input[name=?]", "users[iduff]"
    end
  end
end
