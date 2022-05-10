# frozen_string_literal: true

module UsersBackoffice
  class PointsController < UsersBackofficeController
    before_action :set_point, only: %i[show edit update destroy]

    # GET /points/new
    def new
      @point = Point.new
    end

    # GET /points/1/edit
    def edit
      set_point
    end

    def index
      @point = Point.all
    end

    # POST /points or /points.json
    def create
      @point = Point.new(point_params)
      @point.carona = Carona.find(params[:carona_id])

      respond_to do |format|
        if @point.save
          format.html { redirect_to  users_backoffice_user_carona_points_path, notice: 'ponto(s) intermediário(s) criado com sucesso.' }
          format.json { render :show, status: :created, location: @point }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @point.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /points/1 or /points/1.json
    def update
      set_point
      respond_to do |format|
        if @point.update!(point_params)
          format.html { redirect_to admins_backoffice_point_path(@point), notice: 'points foi devidamente atualizado.' }
          format.json { render :show, status: :ok, location: @point }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @point.errors, status: :unprocessable_entity }
        end
      end
    end

    def reactive
      @point = Point.find(params[:point_id])
      @point.update active: true

      respond_to do |format|
        format.html { redirect_to admins_backoffice_points_path, notice: 'points foi reativado com sucesso.' }
      end
    end

    # DELETE /points/1 or /points/1.json
    def destroy
      @point = Point.find(params[:point_id])
      @point.update active: false

      respond_to do |format|
        format.html { redirect_to admins_backoffice_points_path, notice: 'points foi desativado com sucesso.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_params
      params.require(:point).permit(:address)
    end
  end
end
