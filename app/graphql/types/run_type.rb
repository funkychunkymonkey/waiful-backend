module Types
  class RunType < Types::BaseObject
    field :id, ID, null: false
    field :distance, Int, null: false
    field :data, String, null: false
    field :started_at, GraphQL::Types::ISO8601DateTime, null: false
    field :ended_at, GraphQL::Types::ISO8601DateTime, null: true
    field :gems, Int, null:true

    field :user, UserType, null: false
  end
end