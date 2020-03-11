module Types
  class ExerciseImageType < Types::BaseObject
    field :id, ID, null: false
    field :is_main, Boolean, null: false
    field :path, String, null: false
  end
end
