# frozen_string_literal: true

module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :set_admin, only: %i[edit show update destroy reactive]
    def index
      @admins = Admin.all
    end

    def new
      @admin = Admin.new
    end

    def show; end

    def edit; end

    def update
      respond_to do |format|
        if @admin.update!(admin_params)
          format.html { redirect_to admins_backoffice_admin_path(@admin), notice: 'Admins foi devidamente atualizado.' }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      set_admin
      respond_to do |format|
        if @admin.update active: false
          format.html { redirect_to admins_backoffice_admins_path, notice: 'Admin foi devidamente atualizado.' }
          format.json { head :no_content }
        else
          format.html { render :'admins_backoffice/admins/index', status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end

    def reactive
      set_admin
      @admin.update active: true
      respond_to do |format|
        format.html { redirect_to admins_backoffice_admins_path, notice: 'Admin foi reativado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin }
      end
    end

    private

    def set_admin
      @admin = Admin.find(params[:admin_id])
    end

    def admin_params
      params.require(:admin).permit(:id, :email, :name, :iduff, :active)
    end
  end
end
