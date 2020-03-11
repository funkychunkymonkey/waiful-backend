class CreateJoinTableUserSeries < ActiveRecord::Migration[6.0]
  def change
    create_join_table :series, :users do |t|
      t.index [:series_id, :user_id]
      t.index [:user_id, :series_id]
    end
  end
end
