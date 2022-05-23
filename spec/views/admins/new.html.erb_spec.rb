require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      iduff: "MyString",
      nome: "MyString",
      email: "MyString"
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do

      assert_select "input[name=?]", "admin[iduff]"

      assert_select "input[name=?]", "admin[nome]"

      assert_select "input[name=?]", "admin[email]"
    end
  end
end
