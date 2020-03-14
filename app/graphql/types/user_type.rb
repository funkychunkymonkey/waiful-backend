module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :token, String, null: false
    field :gems, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :current_run, RunType, null: true

    field :series, [SeriesType], null: true

    field :personalities, [Int], null: false
    def personalities
      object.personalities.map{|x| x["personality_id"]}
    end

    field :runs, [RunType], null: true
    def runs
      object.runs.order(id: 'DESC') 
    end

    field :workouts, [WorkoutType], null:false
    def workouts
      object.workouts.order(id: 'DESC') 
    end

    field :waifus, [WaifuType], null:false
    def waifus
      object.waifus.order(updated_at: 'DESC') 
    end
  end
end
