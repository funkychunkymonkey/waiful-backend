class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.string :name
      t.boolean :is_anime
      t.integer :mal_id
      t.string :image_url
      t.string :url
    end
    add_index :series, :mal_id
  end
end
