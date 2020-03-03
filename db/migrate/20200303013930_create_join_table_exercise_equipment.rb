class CreateJoinTableExerciseEquipment < ActiveRecord::Migration[6.0]
  def change
    create_join_table :exercises, :equipments do |t|
      t.index [:exercise_id, :equipment_id]
      t.index [:equipment_id, :exercise_id]
    end
  end
end
