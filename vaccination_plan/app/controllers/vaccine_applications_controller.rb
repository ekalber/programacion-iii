class VaccineApplicationsController < ApplicationController
  before_action :set_vaccine_application, only: %i[ show edit update destroy ]

  # GET /vaccine_applications or /vaccine_applications.json
  def index
    @vaccine_applications = VaccineApplication.all
    @vaccine_applications = @vaccine_applications.where(:child_id => params[:child_id]) if params[:child_id]
    @vaccine_applications = @vaccine_applications.where(:vaccine_id => params[:vaccine_id]) if params[:vaccine_id]
    @vaccine_applications = @vaccine_applications.where(:nurse_id => params[:nurse_id]) if params[:nurse_id]
  end

  # GET /vaccine_applications/1 or /vaccine_applications/1.json
  def show
  end

  # GET /vaccine_applications/new
  def new
    @vaccine_application = VaccineApplication.new
  end

  # GET /vaccine_applications/1/edit
  def edit
  end

  # POST /vaccine_applications or /vaccine_applications.json
  def create
    @vaccine_application = VaccineApplication.new(vaccine_application_params)

    respond_to do |format|
      if @vaccine_application.save
        format.html { redirect_to vaccine_applications_path, notice: "Vaccine application was successfully created." }
        format.json { render :show, status: :created, location: @vaccine_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vaccine_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vaccine_applications/1 or /vaccine_applications/1.json
  def update
    respond_to do |format|
      if @vaccine_application.update(vaccine_application_params)
        format.html { redirect_to vaccine_applications_path, notice: "Vaccine application was successfully updated." }
        format.json { render :show, status: :ok, location: @vaccine_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaccine_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaccine_applications/1 or /vaccine_applications/1.json
  def destroy
    @vaccine_application.destroy
    respond_to do |format|
      format.html { redirect_to vaccine_applications_url, notice: "Vaccine application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaccine_application
      @vaccine_application = VaccineApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vaccine_application_params
      params.require(:vaccine_application).permit(:vaccine_id, :nurse_id, :child_id, :date, :dosis)
    end
end
