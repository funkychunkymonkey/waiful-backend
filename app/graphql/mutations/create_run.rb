module Mutations
  class CreateRun < BaseMutation
    type Types::RunType
    def resolve()
      service = RunService.new(User.find(1))
      service.create
    end
  end
end 
