class CreateJoinTableChartProfile < ActiveRecord::Migration[7.1]
  def change
    create_join_table :charts, :profiles do |t|
      t.index [:chart_id, :profile_id]
      t.index [:profile_id, :chart_id]
    end
  end
end
