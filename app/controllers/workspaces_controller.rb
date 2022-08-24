class WorkspacesController < ApplicationController
  # before_action :workspace_id

  def index
    @workspaces = Workspace.all
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
    params.require(:workspace).permit(:name, :address, :neighborhood, :price, photos: [])
  end
end
