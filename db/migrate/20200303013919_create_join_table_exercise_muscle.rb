class CreateJoinTableExerciseMuscle < ActiveRecord::Migration[6.0]
  def change
    create_join_table :exercises, :muscles do |t|
      t.index [:exercise_id, :muscle_id]
      t.index [:muscle_id, :exercise_id]
    end
  end
end
