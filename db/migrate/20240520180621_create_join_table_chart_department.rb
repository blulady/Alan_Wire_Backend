class CreateJoinTableChartDepartment < ActiveRecord::Migration[7.1]
  def change
    create_join_table :charts, :departments do |t|
      t.index [:chart_id, :department_id]
      t.index [:department_id, :chart_id]
    end
  end
end
