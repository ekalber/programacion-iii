class NursesController < ApplicationController
  before_action :set_nurse, only: %i[ show edit update destroy ]

  # GET /nurses or /nurses.json
  def index
    @nurses = Nurse.all
    @nurses = @nurses.joins(:vaccine_applications).where(:vaccine_applications => {:vaccine_id => params[:vaccine_id]}) if params[:vaccine_id]
    @nurses = @nurses.order((params[:by] || "first_name") + " " + (params[:order] || "asc"))
    @nurses = @nurses.page(params[:page] || 1)
  end

  # GET /nurses/1 or /nurses/1.json
  def show
  end

  # GET /nurses/new
  def new
    @nurse = Nurse.new
  end

  # GET /nurses/1/edit
  def edit
  end

  # POST /nurses or /nurses.json
  def create
    @nurse = Nurse.new(nurse_params)

    respond_to do |format|
      if @nurse.save
        format.html { redirect_to nurses_path, notice: "Nurse was successfully created." }
        format.json { render :show, status: :created, location: @nurse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nurse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nurses/1 or /nurses/1.json
  def update
    respond_to do |format|
      if @nurse.update(nurse_params)
        format.html { redirect_to nurses_path, notice: "Nurse was successfully updated." }
        format.json { render :show, status: :ok, location: @nurse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nurse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nurses/1 or /nurses/1.json
  def destroy
    @nurse.destroy
    respond_to do |format|
      format.html { redirect_to nurses_url, notice: "Nurse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nurse
      @nurse = Nurse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nurse_params
      params.require(:nurse).permit(:user_id, :first_name, :last_name)
    end
end
