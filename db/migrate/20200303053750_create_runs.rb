class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :distance, null: false
      t.text :data, null: false
      t.timestamp :started_at, null: false
      t.timestamp :ended_at
    end
  end
end
