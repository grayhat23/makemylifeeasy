class RequestSchedulesController < ApplicationController
  before_action :set_request_schedule, only: [:show, :edit, :update, :destroy]

  # GET /request_schedules
  # GET /request_schedules.json
  def index
    @request_schedules = RequestSchedule.all
  end

  # GET /request_schedules/1
  # GET /request_schedules/1.json
  def show
  end

  # GET /request_schedules/new
  def new
    @request_schedule = RequestSchedule.new
  end

  # GET /request_schedules/1/edit
  def edit
  end

  # POST /request_schedules
  # POST /request_schedules.json
  def create
    @request_schedule = RequestSchedule.new(request_schedule_params)

    respond_to do |format|
      if @request_schedule.save
        format.html { redirect_to @request_schedule, notice: 'Request schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request_schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_schedules/1
  # PATCH/PUT /request_schedules/1.json
  def update
    respond_to do |format|
      if @request_schedule.update(request_schedule_params)
        format.html { redirect_to @request_schedule, notice: 'Request schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_schedules/1
  # DELETE /request_schedules/1.json
  def destroy
    @request_schedule.destroy
    respond_to do |format|
      format.html { redirect_to request_schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_schedule
      @request_schedule = RequestSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_schedule_params
      params.require(:request_schedule).permit(:request_id, :start_time, :end_date, :phone_number, :address, :s_type)
    end
end
