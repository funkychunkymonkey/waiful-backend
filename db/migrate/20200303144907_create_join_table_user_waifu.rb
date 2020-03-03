class CreateJoinTableUserWaifu < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :waifus do |t|
      t.index [:waifu_id, :user_id]
      t.index [:user_id, :waifu_id]
      t.boolean :is_favorite, default: false
      t.integer :level, default: 1
      t.timestamp :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :updated_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
