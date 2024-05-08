class CreateJoinTablePositionProfile < ActiveRecord::Migration[7.1]
  def change
    create_join_table :positions, :profiles do |t|
      # t.index [:position_id, :profile_id]
      # t.index [:profile_id, :position_id]
    end
  end
end
