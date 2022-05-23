require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        iduff: "Iduff",
        nome: "Nome",
        email: "Email"
      ),
      Admin.create!(
        iduff: "Iduff",
        nome: "Nome",
        email: "Email"
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", text: "Iduff".to_s, count: 2
    assert_select "tr>td", text: "Nome".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
