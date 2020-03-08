module Types
  class WorkoutType < Types::BaseObject
    field :id, ID, null: false
    field :reps, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :exercise, ExerciseType, null: false
    field :user, UserType, null: false
  end
end
