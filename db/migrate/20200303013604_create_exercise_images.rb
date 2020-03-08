class CreateExerciseImages < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_images do |t|
      t.references :exercise, null: false, foreign_key: true
      t.boolean :is_main
      t.string :path

      t.timestamps
    end
  end
end
