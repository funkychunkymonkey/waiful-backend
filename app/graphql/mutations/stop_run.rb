module Mutations
  class StopRun < BaseMutation
    argument :distance, Int, required: true
    argument :data, String, required: true

    type Types::RunType

    def resolve(input)
      service = RunService.new(context[:user])
      service.end(input)
    end
  end
end 
