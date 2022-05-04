# frozen_string_literal: true

module UsersBackoffice
  class UserController < ApplicationController
    def show
      @user = User.find_by_iduff(params[:iduff])
    end
  end
end
