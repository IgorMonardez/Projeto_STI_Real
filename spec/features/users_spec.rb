# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature, js: true do
  before do
    @admin = create(:admin)
    login_user(@admin)
  end
  scenario 'Cadastra Usuarios' do
    visit(new_admins_backoffice_user_path)
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Name', with: Faker::Name.name
    fill_in 'Iduff', with: Faker::IDNumber.brazilian_citizen_number
    click_button 'Create User'
    page.save_screenshot('screenshot.png')
    expect(page).to have_content('Usuário foi criado com sucesso')
  end

  scenario 'Usuário inválido' do
    visit(new_admins_backoffice_user_path)
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Iduff', with: Faker::IDNumber.brazilian_citizen_number
    click_button 'Create User'
    page.save_screenshot('screenshot.png')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'Usuário duplicados' do
    email = Faker::Internet.email
    visit(new_admins_backoffice_user_path)
    fill_in 'Email', with: email
    fill_in 'Name', with: Faker::Name.name
    fill_in 'Iduff', with: Faker::IDNumber.brazilian_citizen_number
    click_button 'Create User'
    visit(new_admins_backoffice_user_path)

    fill_in 'Email', with: email
    fill_in 'Name', with: Faker::Name.name
    fill_in 'Iduff', with: Faker::IDNumber.brazilian_citizen_number
    click_button 'Create User'
    page.save_screenshot('screenshot.png')
    expect(page).to have_content('Email has already been taken')
  end

end
