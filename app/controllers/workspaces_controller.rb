class WorkspacesController < ApplicationController
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
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ws_params
    params.require(:workspace).permit(:name, :address, :neighborhood, :price, :user, :photo)
  end
end
