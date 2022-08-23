class AddPhotoToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :photo, :string
  end
end
