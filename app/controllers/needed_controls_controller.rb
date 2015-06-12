class NeededControlsController < ApplicationController
  before_action :set_needed_control, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /needed_controls
  # GET /needed_controls.json
  def index
    @needed_control = NeededControl.all
  end

  # GET /needed_controls/1
  # GET /needed_controls/1.json
  def show
    @assessment = Assessment.find(params[:assessment_id])
    @hazard = Hazard.find(params[:hazard_id])
  end

  # GET /needed_controls/new
  def new
    @assessment = Assessment.find(params[:assessment_id])
    @hazard = Hazard.find(params[:hazard_id])
    @needed_control = @hazard.build_neededControl
  end

  # GET /needed_controls/1/edit
  def edit
    @assessment = Assessment.find(params[:assessment_id])
    @hazard = Hazard.find(params[:hazard_id])
  end

  # POST /needed_controls
  # POST /needed_controls.json
  def create
    @assessment = Assessment.find(params[:assessment_id])
    @hazard = Hazard.find(params[:hazard_id])
    @needed_control = @hazard.build_neededControl(needed_control_params)

    respond_to do |format|
      if @needed_control.save
        format.html { redirect_to assessment_hazard_path(@assessment, @hazard), notice: 'Needed control was successfully created.' }
       # format.json { render :show, status: :created, location: @needed_control }
      else
        format.html { redirect_to assessment_hazard_path(@assessment, @hazard), notice: 'There was an issue saving your control.' }
        #format.json { render json: @needed_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /needed_controls/1
  # PATCH/PUT /needed_controls/1.json
  def update
    @assessment = Assessment.find(params[:assessment_id])
    @hazard = Hazard.find(params[:hazard_id])
    respond_to do |format|
      if @needed_control.update(needed_control_params)
        format.html { redirect_to assessment_hazard_path(@assessment, @hazard), notice: 'Needed control was successfully updated.' }
        format.json { render :show, status: :ok, location: @needed_control }
      else
        format.html { render :edit }
        format.json { render json: @needed_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needed_controls/1
  # DELETE /needed_controls/1.json
  def destroy
    @needed_control.destroy
    respond_to do |format|
      format.html { redirect_to needed_controls_url, notice: 'Needed control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_needed_control
      @needed_control = NeededControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def needed_control_params
      params.require(:needed_control).permit(:content, :completed)
    end
end
