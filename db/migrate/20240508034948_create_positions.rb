class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions do |t|
      t.string :Position_title

      t.timestamps
    end
  end
end
