# frozen_string_literal: true

module AdminsBackoffice
  class AdminController < AdminsBackofficeController
    def index
      @admins = Admin.all
    end

    def show
      @admin = Admin.find_by_id(params[:id])
    end
  end
end
