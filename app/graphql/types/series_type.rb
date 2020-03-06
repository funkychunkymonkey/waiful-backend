module Types
  class SeriesType < Types::BaseObject
    field :id, ID, null: true
    field :mal_id, Int, null:false
    field :mal_type, String, null:false
    field :is_anime, Boolean, null:false
    field :name, String, null: false
    field :image_url, String, null: false
    field :url, String, null: false
  end
end
