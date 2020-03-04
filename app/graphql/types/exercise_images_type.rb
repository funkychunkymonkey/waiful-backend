module Types
  class ExerciseImagesType < Types::BaseObject
    field :id, ID, null: false
    field :exercise_id, ID, null: false
    field :is_main, Boolean, null: false
    field :path, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
