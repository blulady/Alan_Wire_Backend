class CreateCharts < ActiveRecord::Migration[7.1]
  def change
    create_table :charts do |t|
      t.string :chart_title, null: false
      t.text :chart_data, null: false

      t.timestamps
    end
  end
end
