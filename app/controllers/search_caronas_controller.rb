class SearchCaronasController < ApplicationController
  before_action :set_search_carona, only: %i[ show edit update destroy ]

  # GET /search_caronas or /search_caronas.json
  def index
    @search_caronas = SearchCarona.all
  end

  # GET /search_caronas/1 or /search_caronas/1.json
  def show
  end

  # GET /search_caronas/new
  def new
    @search_carona = SearchCarona.new
  end

  # GET /search_caronas/1/edit
  def edit
  end

  # POST /search_caronas or /search_caronas.json
  def create
    @search_carona = SearchCarona.new(search_carona_params)

    respond_to do |format|
      if @search_carona.save
        format.html { redirect_to search_carona_url(@search_carona), notice: "Search carona was successfully created." }
        format.json { render :show, status: :created, location: @search_carona }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_carona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_caronas/1 or /search_caronas/1.json
  def update
    respond_to do |format|
      if @search_carona.update(search_carona_params)
        format.html { redirect_to search_carona_url(@search_carona), notice: "Search carona was successfully updated." }
        format.json { render :show, status: :ok, location: @search_carona }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search_carona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_caronas/1 or /search_caronas/1.json
  def destroy
    @search_carona.destroy

    respond_to do |format|
      format.html { redirect_to search_caronas_url, notice: "Search carona was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_carona
      @search_carona = SearchCarona.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_carona_params
      params.require(:search_carona).permit(:partida, :chegada, :user_id)
    end
end
