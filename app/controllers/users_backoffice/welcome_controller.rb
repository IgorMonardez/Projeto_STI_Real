module UsersBackoffice
  class WelcomeController < UsersBackofficeController
    def index
      @user = User.find_by_iduff(current_user.iduff)
    end
  end
end

