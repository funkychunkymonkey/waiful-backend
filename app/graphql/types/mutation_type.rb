module Types
  class MutationType < Types::BaseObject
    field :add_series, mutation: Mutations::AddSeries
    field :remove_series, mutation: Mutations::RemoveSeries
  end
end
