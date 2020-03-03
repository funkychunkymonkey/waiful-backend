module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

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
