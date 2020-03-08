module Mutations
  class CreateWorkout < BaseMutation
    argument :exercise_id, ID, required: true
    argument :reps, Int, required: true

    type Types::WorkoutType

    def resolve(input)
      service = WorkoutService.new(User.find(1))
      service.create(input)
    end
  end
end 