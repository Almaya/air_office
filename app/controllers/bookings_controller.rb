class BookingsController < ApplicationController
  def index
    @workspace = Workspace.find(params[:workspace_id])
    @bookings = @workspace.bookings
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
