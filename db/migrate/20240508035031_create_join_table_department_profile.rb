class CreateJoinTableDepartmentProfile < ActiveRecord::Migration[7.1]
  def change
    create_join_table :departments, :profiles do |t|
      # t.index [:department_id, :profile_id]
      # t.index [:profile_id, :department_id]
    end
  end
end
