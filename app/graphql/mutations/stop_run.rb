module Mutations
  class StopRun < BaseMutation
    argument :distance, Int, required: true
    argument :data, String, required: true

    type Types::RunsType

    def resolve(input)
      run = User.find(1).runs.where(ended_at: nil).first
      run.distance = input[:distance]
      run.data = input[:data]
      run.ended_at = Time.current
      run.save
      run
    end
  end
end 
