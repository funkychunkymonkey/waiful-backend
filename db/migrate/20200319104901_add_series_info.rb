class AddSeriesInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :series, :started_at, :string, null: true, default: nil
    add_column :series, :ended_at, :string, null: true, default: nil
    add_column :series, :score, :string, null: true, default: nil
    add_column :series, :episodes, :integer, null: true, default: nil
    add_column :series, :description, :text, null: true, default: nil
  end
end
