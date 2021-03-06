class RequestHistoriesController < ApplicationController
  before_action :set_request_history, only: [:show, :edit, :update, :destroy]

  # GET /request_histories
  # GET /request_histories.json
  def index
    @request_histories = RequestHistory.all
  end

  # GET /request_histories/1
  # GET /request_histories/1.json
  def show
  end

  # GET /request_histories/new
  def new
    @request_history = RequestHistory.new
  end

  # GET /request_histories/1/edit
  def edit
  end

  # POST /request_histories
  # POST /request_histories.json
  def create
    @request_history = RequestHistory.new(request_history_params)

    respond_to do |format|
      if @request_history.save
        format.html { redirect_to @request_history, notice: 'Request history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_histories/1
  # PATCH/PUT /request_histories/1.json
  def update
    respond_to do |format|
      if @request_history.update(request_history_params)
        format.html { redirect_to @request_history, notice: 'Request history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_histories/1
  # DELETE /request_histories/1.json
  def destroy
    @request_history.destroy
    respond_to do |format|
      format.html { redirect_to request_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_history
      @request_history = RequestHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_history_params
      params.require(:request_history).permit(:request_id, :comments, :status)
    end
end
