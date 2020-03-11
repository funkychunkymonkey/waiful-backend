class CreateJoinTableMuscleMuscleGroup < ActiveRecord::Migration[6.0]
  def change
    create_join_table :muscles, :muscle_groups do |t|
      t.index [:muscle_id, :muscle_group_id]
      t.index [:muscle_group_id, :muscle_id]
    end
  end
end
