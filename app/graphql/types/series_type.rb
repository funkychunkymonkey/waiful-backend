module Types
  class SeriesType < Types::BaseObject
    field :id, ID, null: true
    field :mal_id, Int, null:false
    field :mal_type, String, null:false
    field :is_anime, Boolean, null:false
    field :name, String, null: false
    field :image_url, String, null: false
    field :url, String, null: false
    field :started_at, String, null: true
    field :ended_at, String, null: true
    field :score, String, null: true
    field :episodes, String, null: true
    field :description, String, null: true

    field :waifus, [WaifuType], null: false
    def waifus 
      service = JikanService.new
      service.get_characters(object.mal_type, object.mal_id)
    end
  end
end
