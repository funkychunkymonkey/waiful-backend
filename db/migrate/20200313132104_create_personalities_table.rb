class CreatePersonalitiesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users_waifus, :personality_id, :integer
    create_table :personalities_users do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :personality_id, null: false
      t.index [:user_id, :personality_id]
    end
  end
end
