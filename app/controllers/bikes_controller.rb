class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]

  # GET /bikes or /bikes.json
  def display_bikes
    @bikes = Bike.all
    render json: { bikes: @bikes }
  end

  # GET /bikes/1 or /bikes/1.json
  def show
    @bike = Bike.find(params[:id])
  end

  # DELETE /bikes/1 or /bikes/1.json
  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy!

    redirect_to root_path, status: :see_other

    respond_to do |format|
      format.html { redirect_to bikes_url, notice: 'Bike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :image, :description, :deposit, :finance_fee, :option_to_purchase_fee,
                                 :total_amount_payable, :duration)
  end
end
