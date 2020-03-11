module Types
  class MutationType < Types::BaseObject
    field :add_series, mutation: Mutations::AddSeries
    field :remove_series, mutation: Mutations::RemoveSeries
    field :gacha, mutation: Mutations::GachaWaifu
    field :sell_waifu, mutation: Mutations::SellWaifu
    field :favorite_waifu, mutation: Mutations::FavoriteWaifu
    field :unfavorite_waifu, mutation: Mutations::UnfavoriteWaifu
    field :create_run, mutation: Mutations::CreateRun
    field :stop_run, mutation: Mutations::StopRun
    field :create_workout, mutation: Mutations::CreateWorkout
  end
end
