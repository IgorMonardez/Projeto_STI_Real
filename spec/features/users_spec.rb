# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/login_helper'

RSpec.feature 'Users', type: :feature do
  before do
    @user = create(:user)
    login_user(@user)
  end
  scenario 'Cadastra Usuarios' do
    visit(new_admins_backoffice_campu_path)
    fill_in 'email', with: Faker::Internet.email
    fill_in 'name', with: Faker::Name.name
    fill_in 'iduff', with: Faker::IDNumber.brazilian_citizen_number
    click_button 'Create User'

    expect(page).to have_text(Faker::Name.name)
  end
end
