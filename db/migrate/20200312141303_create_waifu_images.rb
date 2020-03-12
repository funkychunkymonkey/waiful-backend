class CreateWaifuImages < ActiveRecord::Migration[6.0]
  def change
    create_table :waifu_images do |t|
      t.references :waifu, null: false, foreign_key: true
      t.string :url
    end
    ActiveRecord::Base.connection.execute("INSERT INTO waifu_images(waifu_id, url) SELECT id, image_url FROM waifus") 
  end
end
