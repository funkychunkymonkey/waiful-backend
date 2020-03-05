module Types
  class EquipmentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :exercises, [ExerciseType], null: false
  end
end
