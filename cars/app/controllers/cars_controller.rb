class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    @cars = @cars.where("color = '#{params[:color]}'") unless params[:color].blank?
    @cars = @cars.where(:brand_id => params[:brand_id]) unless params[:brand_id].blank?

    @color = params[:color]
    @brand_id = params[:brand_id]
    session[:page] = 1

    flash[:notice] = "Estas en el index de vehículos"
  end

  def olds
    @cars = Car.all
    @cars = @cars.where("year < ?", 2000)

    flash[:notice] = "Estas en el olds de vehículos"
  end


  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :year, :doors, :color, :brand_id, :classification_id, :structure_id)
    end
end
