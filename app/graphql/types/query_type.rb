module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false 
    def user
      context[:user]
    end

    field :exercises, [Types::ExerciseType], null:false
    def exercises
      Exercise.where(user_id: nil).or(Exercise.where(user_id: context[:user].id)).all
    end

    field :muscles, [Types::MuscleType], null:false
    def muscles
      Muscle.all
    end

    field :equipments, [Types::EquipmentType], null:false
    def equipments
      Equipment.all
    end

    field :serieses, [Types::SeriesType], null:false do
      argument :mal_type, String, required: true
      argument :search, String, required: false
    end
    def serieses(input)
      if(input[:search] && input[:search] != '')
        SeriesService.new(nil).search(input[:mal_type], input[:search])
      else
        SeriesService.new(nil).top(input[:mal_type])
      end
    end

    field :series, Types::SeriesType, null:false do
      argument :mal_type, String, required: true
      argument :mal_id, Int, required: false
    end
    def series(input)
      SeriesService.new(nil).get_series(input[:mal_type], input[:mal_id])
    end
  end
end
