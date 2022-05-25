# frozen_string_literal: true
require 'webdrivers'
require 'rails_helper'

RSpec.feature 'Home Spec', type: :feature, js: true do
  context 'Login inicial' do
    before do
      @admin = create(:admin)
      login_user(@admin)
    end

    scenario 'Página inicial' do
      expect(page).to have_content('Procurar Caronas')
    end
  end
end


