# frozen_string_literal: true

require 'rails_helper'
require 'webdrivers'

RSpec.feature 'Caronas', type: :feature, js: true do
  before do
    @admin = create(:admin)
    @user = create(:user, name: @admin.nome, iduff: @admin.iduff, email: @admin.email)
    @campu = create(:campu)

    login_user(@admin)
  end

  context 'Permite procurar carona' do
    before do
      @carona = create(:carona, departure: @campu.nome,bairro_departure: @campu.bairro, user_id: @user.id )
    end

    scenario 'com bairro referente a campus na partida' do
      visit users_backoffice_welcome_index_path

      page.fill_in(placeholder: 'Bairro de partida ou nome do campus', with: @campu.bairro)

      click_button 'Procure por carona'
      page.save_screenshot('screenshot-campus.png')
      expect(page).to have_content('Carona pesquisada com sucesso')
    end

    scenario 'e na chegada' do
      visit users_backoffice_welcome_index_path

      page.fill_in(placeholder: 'Bairro de chegada ou nome do campus', with: @campu.bairro)

      click_button 'Procure por carona'
      page.save_screenshot('screenshot-campus.png')
      expect(page).to have_content('Carona pesquisada com sucesso')
    end
  end
  context 'Não permite procurar carona' do
    scenario 'sem bairro referente a campus na partida e chegada' do
      visit users_backoffice_welcome_index_path
      fill_in placeholder: 'Bairro de partida ou nome do campus', with: 'Tribobó'
      fill_in placeholder: 'Bairro de chegada ou nome do campus', with: 'São Cristovão'
      click_button 'Procure por carona'

      page.save_screenshot('screenshot-campus-error.png')

      expect(page).to have_content('Precisa de campus na partida ou na chegada')
    end
    scenario 'sem partida nem chegada' do
      visit users_backoffice_welcome_index_path
      click_button 'Procure por carona'

      page.save_screenshot('screenshot-campus-error.png')

      expect(page).to have_content('Precisa de parâmetros')
    end
  end

  context 'Adicionar carona' do
    scenario 'com campus' do
      visit new_users_backoffice_user_carona_path(logged_user(@admin))
      fill_in 'Preco', with: Faker::Number.number(digits: 1)
      fill_in 'Comments', with: Faker::Address.community
      fill_in 'Departure', with: @campu.nome
      fill_in 'Arrival', with: Faker::Address.street_address

      click_button 'Criar carona'
      page.save_screenshot('screenshot-add-carona.png')
      expect(page).to have_content('Carona foi criada com sucesso.')
    end
    scenario 'com campus' do
      visit new_users_backoffice_user_carona_path(logged_user(@admin))
      fill_in 'Preco', with: Faker::Number.number(digits: 1)
      fill_in 'Comments', with: Faker::Address.community
      fill_in 'Departure', with: Faker::Address.street_address
      fill_in 'Arrival', with: Faker::Address.street_address

      click_button 'Criar carona'
      page.save_screenshot('screenshot-add-carona-error.png')
      expect(page).to have_content('precisa haver ao menos um campus')
    end
  end
end
