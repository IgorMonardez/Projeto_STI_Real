# frozen_string_literal: true

module AdminsBackoffice
  class UsersController < AdminsBackofficeController

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admins_backoffice_user_path, notice: 'Usuário foi devidamente atualizado.' }
          format.json { render :index, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to user_url(@user), notice: 'Usuário foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.update active: false

      respond_to do |format|
        format.html { redirect_to user_url, notice: 'Usuário foi desativado com sucesso.' }
        format.json { head :no_content }
      end
    end

    def reactive
      @user.update active: true

      respond_to do |format|
        format.html { redirect_to}
      end
    end

    private

    def user_params
      params.require(:user).permit(:id, :email, :name, :iduff, :encrypted_password)
    end
  end
end
