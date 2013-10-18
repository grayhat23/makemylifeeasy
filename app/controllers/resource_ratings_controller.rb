class ResourceRatingsController < ApplicationController
  before_action :set_resource_rating, only: [:show, :edit, :update, :destroy]

  # GET /resource_ratings
  # GET /resource_ratings.json
  def index
    @resource_ratings = ResourceRating.all
  end

  # GET /resource_ratings/1
  # GET /resource_ratings/1.json
  def show
  end

  # GET /resource_ratings/new
  def new
    @resource_rating = ResourceRating.new
  end

  # GET /resource_ratings/1/edit
  def edit
  end

  # POST /resource_ratings
  # POST /resource_ratings.json
  def create
    @resource_rating = ResourceRating.new(resource_rating_params)

    respond_to do |format|
      if @resource_rating.save
        format.html { redirect_to @resource_rating, notice: 'Resource rating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource_rating }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_ratings/1
  # PATCH/PUT /resource_ratings/1.json
  def update
    respond_to do |format|
      if @resource_rating.update(resource_rating_params)
        format.html { redirect_to @resource_rating, notice: 'Resource rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_ratings/1
  # DELETE /resource_ratings/1.json
  def destroy
    @resource_rating.destroy
    respond_to do |format|
      format.html { redirect_to resource_ratings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_rating
      @resource_rating = ResourceRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_rating_params
      params.require(:resource_rating).permit(:resource_id, :rating, :request_id, :customer_id, :comments)
    end
end
