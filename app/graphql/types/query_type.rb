module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false 
    def users
      User.all
    end

    field :runs, [Types::RunsType], null:false
    def runs
      Run.all
    end

    field :exercises, [Types::ExercisesType], null:false
    def exercises
      Exercise.all
    end

    field :muscles, [Types::MusclesType], null:false
    def muscles
      Muscle.all
    end

    field :equipments, [Types::EquipmentsType], null:false
    def equipments
      Equipment.all
    end
  end
end
