class HazardsController < ApplicationController
  before_action :set_hazard, only: [:show, :edit, :update, :destroy]
  before_action :set_assessment
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /hazards
  # GET /hazards.json
  def index
    @hazards = @assessment.hazards.all
  end

  # GET /hazards/1
  # GET /hazards/1.json
  def show
    @needed_control = @hazard.neededControl
  end

  # GET /hazards/new
  def new
    @hazard = @assessment.hazards.new
  end

  # GET /hazards/1/edit
  def edit
  end

  # POST /hazards
  # POST /hazards.json
  def create
    @hazard = @assessment.hazards.new(hazard_params)

    respond_to do |format|
      if @hazard.save
        format.html { redirect_to assessment_hazard_path(@assessment, @hazard), notice: 'Hazard was successfully created.' }
        format.json { render :show, status: :created, location: @hazard }
      else
        format.html { render :new }
        format.json { render json: @hazard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hazards/1
  # PATCH/PUT /hazards/1.json
  def update
    respond_to do |format|
      if @hazard.update(hazard_params)
        format.html { redirect_to assessment_hazard_path(@assessment, @hazard), notice: 'Hazard was successfully updated.' }
        format.json { render :show, status: :ok, location: @hazard }
      else
        format.html { render :edit }
        format.json { render json: @hazard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hazards/1
  # DELETE /hazards/1.json
  def destroy
    @hazard.destroy
    respond_to do |format|
      format.html { redirect_to assessment_hazards_path(@assessment), notice: 'Hazard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hazard
      @hazard = Hazard.find(params[:id])
    end

    def set_assessment
      @assessment = Assessment.find(params[:assessment_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hazard_params
      params.require(:hazard).permit(:name, :description, :exposure, :occurance, :probability, :consequence, :rating, :control, :assessment_id)
    end

end
