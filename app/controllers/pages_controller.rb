class PagesController < ApplicationController
  def home
    @workspaces = Workspace.all
  end
end

