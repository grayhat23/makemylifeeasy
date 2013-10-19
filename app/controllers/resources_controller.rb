class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new

    @user = User.new
    @resource = Resource.new

    @grouped_options = {}

    @servicetypes = ServiceType.all
    @servicetypes.each do |j|
    @group = []
      @services = Service.where(:service_type_id => j.id)
      @services.each do |i|
        @group.push(i.name);
      end
    @grouped_options[j.name] = @group
    end

  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create

    @user = User.new
    @resource = Resource.new

    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.phone_number = params[:user][:phone_number]
    @user.address = params[:user][:address]
    @user.email =  @user.first_name + @user.last_name + "@email.com".strip;
    @user.email =  @user.email.gsub(/\s+/, "");
    @user.password = "!Password"
    @user.password_confirmation ="!Password"
    @user.role= 3;

    @resource.average_rating= 4;
    @resource.r_type= 1;

    if @user.errors.blank?
      @user.save

      @resource.user = @user;
      @resource.save

      @services = params[:services]
      @services.each do |i|
        @srvc = Service.where('name' => i).first
        if(@srvc.present?)
          @resourceservice = ResourceService.new
          @resourceservice.service_id = @srvc.id
          @resourceservice.resource = @resource
          @resourceservice.service_type_id = @srvc.service_type_id
          @resourceservice.save
        end
      end



    end

    respond_to do |format|
          if @resource.save
            format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
            format.json { render action: 'show', status: :created, location: @resource }
          else
            format.html { render action: 'new' }
            format.json { render json: @resource.errors, status: :unprocessable_entity }
          end
      end
    #@resource = Resource.new(resource_params)
    #
    #  respond_to do |format|
    #    if @resource.save
    #      format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
    #      format.json { render action: 'show', status: :created, location: @resource }
    #    else
    #      format.html { render action: 'new' }
    #      format.json { render json: @resource.errors, status: :unprocessable_entity }
    #    end
    end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:user).permit(:first_name, :last_name, :address)
    end
  end

