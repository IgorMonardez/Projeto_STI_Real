# frozen_string_literal: true

require 'rspec-helper'

Rspec.feature 'Carona', type: :system do
  context 'Permite criar carona' do
    it 'com bairro referente a campus na partida' do
      visit 'users_backoffice/welcome'

      within('#departure-search') do
        fill_in 'Partida', with: 'Centro'
      end
      click_button 'Procure por carona'
      expect(page).to 'Campus Valonguinho'
    end

    it 'e na chegada' do
      visit 'users_backoffice/welcome'

      within('#departure-search') do
        fill_in 'Partida', with: 'Centro'
      end
      click_button 'Procure por carona'
      expect(page).to have_text('Campus Valonguinho')
    end
  end
  context 'Não permite criar carona' do
    it 'sem bairro referente a campus na partida e chegada' do
      visit 'users_backoffice/welcome'

      within('#departure-search') do
        fill_in 'Partida', with: 'Tribobó'
        fill_in 'Chegada', with: 'São Cristovão'
      end
      click_button 'Procure por carona'

      expect(page).to
    end
    it 'sem partida nem chegada' do
      visit 'users_backoffice/welcome'
    end
  end
end
