class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
    render json: @deliveries, status: :ok
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
    render json: @delivery, status: :ok
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: @delivery, status: :created
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    if @delivery.update(delivery_params)
      render json: @delivery, status: :ok
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:pick_up_date, :name, :user_id)
    end
end
