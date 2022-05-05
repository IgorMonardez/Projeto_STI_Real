# frozen_string_literal: true

module AdminsBackoffice
  class CampusController < AdminsBackofficeController
    before_action :set_campu, only: %i[show edit update destroy]

    # GET /campus or /campus.json
    def index
      @campus = Campu.all
    end

    # GET /campus/1 or /campus/1.json
    def show
      set_campu
    end

    # GET /campus/new
    def new
      @campu = Campu.new
    end

    # GET /campus/1/edit
    def edit
      set_campu
    end

    # POST /campus or /campus.json
    def create
      @campu = Campu.new(campu_params)

      respond_to do |format|
        if @campu.save
          format.html { redirect_to admins_backoffice_campu_path(@campu), notice: 'Campus foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @campu }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @campu.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /campus/1 or /campus/1.json
    def update
      set_campu
      respond_to do |format|
        if @campu.update!(campu_params)
          format.html { redirect_to admins_backoffice_campu_path(@campu), notice: 'Campus foi devidamente atualizado.' }
          format.json { render :show, status: :ok, location: @campu }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @campu.errors, status: :unprocessable_entity }
        end
      end
    end

    def reactive
      @campu.update active: true

      respond_to do |format|
        format.html { redirect_to admins_backoffice_campus_path, notice: 'Campus foi reativado com sucesso.' }
      end
    end

    # DELETE /campus/1 or /campus/1.json
    def destroy
      @campu.update active: false

      respond_to do |format|
        format.html { redirect_to admins_backoffice_campus_path, notice: 'Campus foi desativado com sucesso.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_campu
      @campu = Campu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campu_params
      params.require(:campu).permit(:address, :nome, :numero, :bairro, :cidade, :cep)
    end
  end
end
