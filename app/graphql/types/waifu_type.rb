module Types
  class WaifuType < Types::BaseObject
    field :id, ID, null: false
    field :mal_id, Int, null:false
    field :name, String, null: false
    field :image_url, String, null: false
    field :url, String, null: false
    field :level, Int, null: false
    field :is_favorite, Boolean, null: false
    field :created_at, String, null: false
  end
end
