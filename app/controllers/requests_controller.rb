class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :assign, :reject, :service, :statusupdate]
  before_action :load_arrays
  include ApplicationHelper

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  def orders
    @requests = Request.find_all_by_status( [RequestStatus::New, RequestStatus::Assigned, RequestStatus::PickedUp, RequestStatus::Delivered, RequestStatus::Serviced] )
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new

    @service_type_id = params[:st_id]
    @service_id = params[:s_id]
  end

  def assign
  end

  def reject
  end

  def service
    @status = params[:st]
  end




  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.service_id=8
    @request.service_type_id=2
    @request.service_type_id=2
    @request.status=1

    #@request.customer_id=Customer.all.where.('user_id = ?',current_user).id

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end


  def statusupdate

    if(params[:status].present?)
      @request.status = params[:status]
      @request.history.status = @request.status
    end

    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to orders_path, notice: 'Order successfully updated.' }
        format.js { render :js => "close_modal();refresh_page();" }
        format.json { render action: 'orders', status: :created }
      elsif (@request.status == RequestStatus::Assigned)
        format.html { render action: 'assign' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      else

      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])

      @service_type_id = @request.service_type_id

      @service_id = @request.service_id

      @resource_services = ResourceService.find_all_by_service_type_id_and_service_id(@service_type_id, @service_id, :select => "resource_id").map(&:resource_id)

      @resources = Resource.find_all_by_id(@resource_services)

    end

    def load_arrays
      @service_types = ServiceType.all

      if(!@service_type_id.nil?)
        @services = Service.find_all_by_service_type_id(@service_type_id)
      else
        @services = []
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:status, :customer_id, :service_type_id, :service_id, :resource_id, :charge, :query, :budget, history_attributes: [:id, :comments, :status])
    end
end
