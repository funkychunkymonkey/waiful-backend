module Types
  class RunsType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :distance, Int, null: false
    field :data, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
