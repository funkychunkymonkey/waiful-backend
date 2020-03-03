class CreateWaifus < ActiveRecord::Migration[6.0]
  def change
    create_table :waifus do |t|
      t.string :name
      t.integer :mal_id
      t.string :image_url
      t.string :url
      t.references :series, null: false, foreign_key: true
    end
  end
end
