module Mutations
  class CreateRun < BaseMutation
    type Types::RunType
    def resolve()
      service = RunService.new(context[:user])
      service.create
    end
  end
end 
