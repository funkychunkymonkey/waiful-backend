module Types
  class MuscleType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :exercises, [ExerciseType], null: false
    field :muscle_groups, [MuscleGroupType], null: false
  end
end
