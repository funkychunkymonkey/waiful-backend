module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :token, String, null: false
    field :gems, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :current_run, RunType, null: true
    field :runs, [RunType], null: true
    field :series, [SeriesType], null: false
    field :workouts, [WorkoutType], null:false
  end
end
