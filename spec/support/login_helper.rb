# frozen_string_literal: true

module LoginHelper
  include Iduff::KeycloakClient::Support::LoginHelper
  include ApplicationHelper

  def login_user(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:logged_user).and_return(user)
    logged_user(user)
    login(user.iduff)
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
