module Types
  class MusclesType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :exercises, [ExercisesType], null: false
  end
end
