class BookingsController < ApplicationController
  before_action :find_workspace

  def index
    @bookings = @workspace.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.workspace = @workspace
    if @booking.save
      redirect_to workspace_booking_path(@workspace, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to workspace_bookings_path(@workspace)
  end

  private

  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
