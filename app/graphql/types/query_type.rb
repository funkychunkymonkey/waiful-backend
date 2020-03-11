module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false 
    def users
      User.all
    end

    field :user, Types::UserType, null: false 
    def user
      User.where(id: 1).first
    end

    field :exercises, [Types::ExerciseType], null:false
    def exercises
      Exercise.all
    end

    field :muscles, [Types::MuscleType], null:false
    def muscles
      Muscle.all
    end

    field :equipments, [Types::EquipmentType], null:false
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
