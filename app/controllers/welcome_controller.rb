# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @user = User.find_by_iduff(current_user.iduff)
  end
end
