class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
  end

  def show
  end

  def new
  end

  def create
  end
end
