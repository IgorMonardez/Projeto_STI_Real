# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'Cadastra Usuarios' do
    visit(admins_backoffice_campus_path)
    
  end
end
