class RenamePositionTitle < ActiveRecord::Migration[7.1]
  def change
    rename_column :positions, :Position_title, :position_title
  end
end
