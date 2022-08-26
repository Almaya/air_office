class WorkspacesController < ApplicationController
  # before_action :workspace_id

  def index

    if params[:query].present?
      @workspaces = Workspace.global_search(params[:query])
    else
      @workspaces = Workspace.all
    end
    
    # Geocoding
    @markers = @workspaces.geocoded.map do |workspace|
      {
        lat: workspace.latitude,
        lng: workspace.longitude,
        info_window: render_to_string(partial: "info_window", locals: {workspace: workspace})
      }
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(ws_params)
    @workspace.user = current_user
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    # if @workspace.user == current_user
    @workspace = Workspace.find(params[:id])
    # else
    #   render :show, status: :unprocessable_entity
    # end
  end

  def update
    @workspace = Workspace.find(params[:id])
    # raise
    if @workspace.update(ws_params)
      redirect_to workspace_path(@workspace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy

    redirect_to workspaces_path, status: :see_other
  end

  private

  # def workspace_id
  #   @workspace = Workspace.find(params[:id])
  # end


  def ws_params
    params.require(:workspace).permit(:name, :address, :neighborhood, :price, :latitude, :longitude, photos: [])
  end
end
