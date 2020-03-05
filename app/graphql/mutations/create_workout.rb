module Mutations
  class CreateWorkout < BaseMutation
    argument :exercise_id, ID, required: true
    argument :reps, Int, required: true

    type Types::WorkoutsType

    def resolve(input)
      User.find(1).workouts.create!({
        exercise_id: input[:exercise_id],
        reps: input[:reps],
        created_at: Time.current,
        updated_at: Time.current
      })
    end
  end
end 