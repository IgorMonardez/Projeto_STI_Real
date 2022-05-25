# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            nome: 'MyString',
                            iduff: 1
                          ))
  end

  it 'renders the edit users form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'users[nome]'

      assert_select 'input[name=?]', 'users[iduff]'
    end
  end
end
