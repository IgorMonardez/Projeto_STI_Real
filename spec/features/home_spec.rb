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



# RSpec.describe 'First Script' do
#   # it 'uses eight components' do
#   #   driver = Selenium::WebDriver.for :chrome
#   #
#   #   # driver.get('https://google.com')
#   #   #
#   #   # title = driver.title
#   #   # expect(title).to eq('Google')
#   #   #
#   #   # driver.manage.timeouts.implicit_wait = 500
#   #   #
#   #   # search_box = driver.find_element(name: 'q')
#   #   # search_button = driver.find_element(name: 'btnK')
#   #   #
#   #   # search_box.send_keys('Selenium')
#   #   # search_button.click
#   #   #
#   #   # search_box = driver.find_element(name: 'q')
#   #   # value = search_box.attribute('value')
#   #   # expect(value).to eq('Selenium')
#   #
#   #   driver.quit
#   # end
#
#   before do
#
#   end
#
#   it ''
#
# end


