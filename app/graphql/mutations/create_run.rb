module Mutations
  class CreateRun < BaseMutation
    type Types::RunType
    def resolve()
      User.find(1).runs.create!({
        distance: 0,
        data: "",
        started_at: Time.current
      })
    end
  end
end 
