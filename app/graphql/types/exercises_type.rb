module Types
  class ExercisesType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :exercise_category_id, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :muscles, [MusclesType], null: false
    field :exercise_images, [ExerciseImagesType], null: false
    def exercise_images
      ExerciseImage.all
    end
    field :equipments, [EquipmentsType], null: false 
  end
end
