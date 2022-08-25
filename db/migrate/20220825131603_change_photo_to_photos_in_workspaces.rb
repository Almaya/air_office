class ChangePhotoToPhotosInWorkspaces < ActiveRecord::Migration[7.0]
  def up
    remove_column :workspaces, :photo
    add_column :workspaces, :photos, :string, array: true, default: []

    puts 'Updating Workspaces table to include multiple photos per workspace'
  end

  def down
    remove_column :workspaces, :photos
    add_column :workspaces, :photo, :string

    puts 'Changing Workspaces table back to include only one photo per workspace'
  end
end
