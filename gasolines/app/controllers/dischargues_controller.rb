class DischarguesController < ApplicationController
  before_action :set_dischargue, only: [:show, :edit, :update, :destroy]

  # GET /dischargues
  # GET /dischargues.json
  def index
    @dischargues = Dischargue.all
    @dischargues = @dischargues.where(:station_id => params[:station_id]) unless params[:station_id].blank?
    t = Truck.find(params[:truck_id]) unless params[:truck_id].blank?
    @dischargues = @dischargues.where(:load_id => t.loads.map(&:id)) unless t.nil?
    @dischargues = @dischargues.where("liters < ?", params[:liters]) unless params[:liters].blank?

  end

  # GET /dischargues/1
  # GET /dischargues/1.json
  def show
  end

  # GET /dischargues/new
  def new
    @dischargue = Dischargue.new
    @trucks = Truck.all.select { | t | t.liters_load > 0 }
    @stations = Station.all.select { | s | (s.max_liters - s.loaded_liters) > 0 }
  end

  # GET /dischargues/1/edit
  def edit
  end

  # POST /dischargues
  # POST /dischargues.json
  def create
    @dischargue = Dischargue.new(dischargue_params)
    @trucks = Truck.all.select { | t | t.liters_load > 0 }
    @stations = Station.all.select { | s | (s.max_liters - s.loaded_liters) > 0 }

    @dischargue.load_id = Truck.find(params[:truck_id]).available_load.id

    respond_to do |format|
      if @dischargue.save
        format.html { redirect_to @dischargue, notice: 'Dischargue was successfully created.' }
        format.json { render :show, status: :created, location: @dischargue }
      else
        format.html { render :new }
        format.json { render json: @dischargue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dischargues/1
  # PATCH/PUT /dischargues/1.json
  def update
    respond_to do |format|
      if @dischargue.update(dischargue_params)
        format.html { redirect_to @dischargue, notice: 'Dischargue was successfully updated.' }
        format.json { render :show, status: :ok, location: @dischargue }
      else
        format.html { render :edit }
        format.json { render json: @dischargue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dischargues/1
  # DELETE /dischargues/1.json
  def destroy
    @dischargue.destroy
    respond_to do |format|
      format.html { redirect_to dischargues_url, notice: 'Dischargue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dischargue
      @dischargue = Dischargue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dischargue_params
      params.require(:dischargue).permit(:liters, :date, :station_id, :load_id)
    end
end
