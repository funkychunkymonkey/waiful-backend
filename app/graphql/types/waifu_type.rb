module Types
  class WaifuType < Types::BaseObject
    field :id, ID, null: false
    field :mal_id, Int, null:false
    field :name, String, null: false
    field :image_url, String, null: false
    field :url, String, null: false
    field :is_favorite, Boolean, null: false
    field :created_at, String, null: false
    field :series, SeriesType, null: false
    field :waifu_images, [WaifuImageType], null: false
    field :personality_id, Int, null: true
    field :role, String, null: true

    field :description, String, null: false
    def description
      object.description == nil ? '' : object.description
    end

    field :level, Int, null: false
    def level
      object[:level] == nil ? 1 : object[:level]
    end
  end
end
