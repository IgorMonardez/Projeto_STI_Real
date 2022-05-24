# frozen_string_literal: true

module UsersBackoffice
  class CaronasController < UsersBackofficeController
    before_action :set_carona, only: %i[show edit update]

    # GET /caronas or /caronas.json
    def index
      @caronas = Carona.where(user_id: User.find_by_iduff(current_user.iduff).id).order(created_at: :desc)
      @user = User.find_by_iduff(current_user.iduff)
    end

    def search
      @user = User.find_by_iduff(current_user.iduff)
      @departure = params[:departure].downcase
      @arrival = params[:arrival].downcase
      if @departure.blank? && @arrival.blank?
        redirect_to users_backoffice_welcome_index_path and nil
        flash[:notice] = 'Precisa dos parâmetros'
      elsif Campu.find_by_bairro(@departure).blank? && Campu.find_by_bairro(@arrival).blank?
        redirect_to users_backoffice_welcome_index_path and nil
        flash[:notice] = 'Precisa de campus na partida ou na chegada'
      else
        flash[:notice] = 'Carona pesquisada com sucesso'
        @results = Carona.where(
          'lower(bairro_departure) = :departure OR lower(bairro_arrival) = :arrival', departure: @departure, arrival: @arrival
        )
      end
    end

    # GET /caronas/1 or /caronas/1.json
    def show
      @carona = Carona.find(params[:id])
      @point = @carona.points
    end

    # GET /caronas/new
    def new
      @carona = Carona.new
      @points = @carona.points.build
    end

    # GET /caronas/1/edit
    def edit
      set_carona
    end

    # POST /caronas or /caronas.json
    def create
      @carona = Carona.new(carona_params)
      @carona.user = User.find_by_iduff(current_user.iduff)
      @campus = Campu.all

      respond_to do |format|
        if @carona.save
          format.html { redirect_to users_backoffice_user_caronas_path, notice: 'Carona foi criada com sucesso.' }
          format.json { render :show, status: :created, location: @carona }
        else
          format.html { render action: :new, status: :unprocessable_entity }
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
      params.require(:carona).permit(:preco, :qtd_passageiros, :date_hour, :departure, :arrival, :user_id,
                                     :bairro_departure, :bairro_arrival,
                                     points_attributes: %i[id address _destroy])
    end
  end
end
