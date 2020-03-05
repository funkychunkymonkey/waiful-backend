module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :token, String, null: false
    field :gems, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
    field :waifus, [WaifuType], null: false
    def waifus
      object.waifus
    end
    field :series, [SeriesType], null: false
    def series
      object.series
    end
    field :workouts, [WorkoutType], null: false
    def workouts
      object.workouts
    end
    field :runs, [RunType], null: false
    def runs
      object.runs
    end
  end
end
