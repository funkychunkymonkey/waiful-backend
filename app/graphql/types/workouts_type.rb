module Types
  class WorkoutsType < Types::BaseObject
    field :id, ID, null: false
    # field :user_id, ID, null:false
    # field :exercise_id, ID, null: false
    # field :reps, Int, null: false
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
