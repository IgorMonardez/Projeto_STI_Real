class CaronasController < ApplicationController
  before_action :set_carona, only: %i[ show edit update destroy ]

  # GET /caronas or /caronas.json
  def index
    @caronas = Carona.all
  end

  # GET /caronas/1 or /caronas/1.json
  def show
  end

  # GET /caronas/new
  def new
    @carona = Carona.new
  end

  # GET /caronas/1/edit
  def edit
  end

  # POST /caronas or /caronas.json
  def create
    @carona = Carona.new(carona_params)

    respond_to do |format|
      if @carona.save
        format.html { redirect_to carona_url(@carona), notice: "Carona was successfully created." }
        format.json { render :show, status: :created, location: @carona }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caronas/1 or /caronas/1.json
  def update
    respond_to do |format|
      if @carona.update(carona_params)
        format.html { redirect_to carona_url(@carona), notice: "Carona was successfully updated." }
        format.json { render :show, status: :ok, location: @carona }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caronas/1 or /caronas/1.json
  def destroy
    @carona.destroy

    respond_to do |format|
      format.html { redirect_to caronas_url, notice: "Carona was successfully destroyed." }
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
      params.require(:carona).permit(:preco, :qtd_passageiros, :date_hour, :departure, :arrival)
    end
end
