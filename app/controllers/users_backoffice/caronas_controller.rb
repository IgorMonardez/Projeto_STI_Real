# frozen_string_literal: true

module UsersBackoffice
  class CaronasController < UsersBackofficeController
    before_action :set_carona, only: %i[show edit update destroy]

    # GET /caronas or /caronas.json
    def index
      @caronas = Carona.where(user_id: current_user).order(created_at: :desc)
    end

    # GET /caronas/1 or /caronas/1.json
    def show
      @carona = Carona.find(params[:id])
    end

    # GET /caronas/new
    def new
      @carona = Carona.new
    end

    # GET /caronas/1/edit
    def edit
      set_carona
    end

    # POST /caronas or /caronas.json
    def create
      @carona = Carona.new(carona_params)
      @carona.user = current_user

      respond_to do |format|
        if @carona.save
          format.html { redirect_to users_backoffice_user_caronas_path, notice: 'Carona was successfully created.' }
          format.json { render :show, status: :created, location: @carona }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @carona.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /caronas/1 or /caronas/1.json
    def update
      set_carona
      respond_to do |format|
        if @carona.update(carona_params)
          format.html do
            redirect_to users_backoffice_user_carona_path(@carona), notice: 'Carona was successfully updated.'
          end
          format.json { render :show, status: :ok, location: @carona }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @carona.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /caronas/1 or /caronas/1.json
    def destroy
      @carona = Carona.find(params[:carona_id])
      @carona.destroy

      respond_to do |format|
        format.html { redirect_to users_backoffice_user_caronas_path, notice: 'Carona was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_carona
      @carona = Carona.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carona_params
      params.require(:carona).permit(:preco, :qtd_passageiros, :date_hour, :departure, :arrival, :user_id)
    end
  end
end
