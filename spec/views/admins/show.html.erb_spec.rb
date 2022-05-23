require 'rails_helper'

RSpec.describe "admins/show", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      iduff: "Iduff",
      nome: "Nome",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Iduff/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
  end
end
