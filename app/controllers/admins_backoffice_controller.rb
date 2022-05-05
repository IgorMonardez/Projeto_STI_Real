# frozen_string_literal: true

class AdminsBackofficeController < ApplicationController
  before_action :authenticate_admin!
  autocomplete :user, :name, :extra_data => [:iduff] do |items|
    CustomJSON::Encoder.encode(items)
  end

  layout 'admins_backoffice'
end
