module Types
  class WaifuType < Types::BaseObject
    field :id, ID, null: false
    field :mal_id, Int, null:false
    field :name, String, null: false
    field :image_url, String, null: false
    field :url, String, null: false
    field :level, Int, null: false
    def level
      object.level == nil ? 1 : object.level
    end

    field :is_favorite, Boolean, null: false
    field :created_at, String, null: false
    
    field :series, SeriesType, null: false
    field :waifu_images, [WaifuImageType], null: false
  end
end
