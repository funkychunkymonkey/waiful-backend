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

    field :series, [Types::SeriesType], null:false do
      argument :mal_type, String, required: true
      argument :search, String, required: false
    end
    def series(input)
      if(input[:search] && input[:search] != '')
        SeriesService.new(nil).search(input[:mal_type], input[:search])
      else
        SeriesService.new(nil).top(input[:mal_type])
      end
    end
  end
end
