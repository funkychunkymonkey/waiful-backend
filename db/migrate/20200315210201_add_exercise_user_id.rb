class AddExerciseUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :user_id, :integer, null: true, default: nil
    remove_column :exercises, :exercise_category_id
  end
end
