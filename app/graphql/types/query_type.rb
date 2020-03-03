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
  end
end
