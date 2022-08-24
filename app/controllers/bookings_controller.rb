class BookingsController < ApplicationController
  before_action :find_workspace
  before_action :find_booking, only: %i[show edit update]

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
    raise
    if @booking.save
      redirect_to workspace_booking_path(@workspace, @booking), notice: 'Booking successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to workspace_booking_path(@workspace, @booking), notice: 'Booking successfully updated'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to workspace_bookings_path(@workspace), notice: 'Booking successfully deleted'
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
