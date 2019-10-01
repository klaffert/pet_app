class RenameTypetoPetType < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :type, :petType
  end
end
