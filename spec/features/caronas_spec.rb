# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Caronas', type: :feature do
  scenario 'Listar carona' do
    user = create(:user, id: '08225892739')
    carona = build(:carona, user_id: '08225892739', :departure => 'Campus Valonguinho', arrival: 'Campus Praia Vermelha')
    puts carona.inspect
    visit(users_backoffice_user_caronas_path(user.iduff))
    expect(page).to have_content('Campus Valonguinho')
  end
  context 'Permite criar carona' do

    scenario 'com bairro referente a campus na partida' do
      visit 'users_backoffice/welcome#index'
      within('#departure-search') do
        fill_in 'Partida', with: 'Centro'
      end
      click_button 'Procure por carona'
      expect('users_backoffice/users/current_user.id/search').to have_text('Campus Valonguinho')
    end

    scenario 'e na chegada' do
      visit 'users_backoffice/welcome#index'
      within('#departure-search') do
        fill_in 'Chegada', with: 'Centro'
      end
      click_button 'Procure por carona'
      expect(page).to have_text('Campus Valonguinho')
    end
  end
  context 'Não permite criar carona' do
    scenario 'sem bairro referente a campus na partida e chegada' do
      visit 'users_backoffice/welcome#index'

      within('#departure-search') do
        fill_in 'Partida', with: 'Tribobó'
        fill_in 'Chegada', with: 'São Cristovão'
      end
      click_button 'Procure por carona'

      expect(page).to
    end
    scenario 'sem partida nem chegada' do
      visit 'users_backoffice/welcome#index'
    end
  end
end
