class BookingsController < ApplicationController
  before_action :find_workspace

  def index
    @bookings = @workspace.bookings
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new()
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
