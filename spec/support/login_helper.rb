# frozen_string_literal: true

module LoginHelper
  include Iduff::KeycloakClient::Support::LoginHelper

  def login_user(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    login(user.iduff)
    current_user = user
    visit('/')
  end

  private

  def escolhe_perfil(perfil)
    choose("perfil_#{perfil.id}")
    click_button 'Selecionar'
  end

  RSpec.configure do |config|
    config.include LoginHelper
  end
end
