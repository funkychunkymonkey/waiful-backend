module Types
  class MutationType < Types::BaseObject
    field :add_series, mutation: Mutations::AddSeries
    field :remove_series, mutation: Mutations::RemoveSeries
    field :gacha, mutation: Mutations::GachaWaifu
    field :favorite_waifu, mutation: Mutations::FavoriteWaifu
    field :unfavorite_waifu, mutation: Mutations::UnfavoriteWaifu
  end
end
