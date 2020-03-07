module Types
  class MuscleGroupType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :muscles, [MuscleType], null: false
  end
end
