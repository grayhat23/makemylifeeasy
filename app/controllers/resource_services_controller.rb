class ResourceServicesController < ApplicationController
  before_action :set_resource_service, only: [:show, :edit, :update, :destroy]

  # GET /resource_services
  # GET /resource_services.json
  def index
    @resource_services = ResourceService.all
  end

  # GET /resource_services/1
  # GET /resource_services/1.json
  def show
  end

  # GET /resource_services/new
  def new
    @resource_service = ResourceService.new
  end

  # GET /resource_services/1/edit
  def edit
  end

  # POST /resource_services
  # POST /resource_services.json
  def create
    @resource_service = ResourceService.new(resource_service_params)

    respond_to do |format|
      if @resource_service.save
        format.html { redirect_to @resource_service, notice: 'Resource service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_services/1
  # PATCH/PUT /resource_services/1.json
  def update
    respond_to do |format|
      if @resource_service.update(resource_service_params)
        format.html { redirect_to @resource_service, notice: 'Resource service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_services/1
  # DELETE /resource_services/1.json
  def destroy
    @resource_service.destroy
    respond_to do |format|
      format.html { redirect_to resource_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_service
      @resource_service = ResourceService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_service_params
      params.require(:resource_service).permit(:resource_id, :service_type_id, :service_id)
    end
end
