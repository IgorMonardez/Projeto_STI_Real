# frozen_string_literal: true

module UsersBackoffice
  class UserController < UsersBackofficeController
    def show
      @user = User.find.params([:id])
    end
  end
end
