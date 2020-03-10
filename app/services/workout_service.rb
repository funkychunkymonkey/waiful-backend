class WorkoutService
    def initialize(user)
        @user = user
    end

    def create(input)
        workout = @user.workouts.create!({
          exercise_id: input[:exercise_id],
          reps: input[:reps],
          created_at: Time.current,
          updated_at: Time.current
        })
        workout.gems input[:reps]
        @user.gems = @user.gems + workout.gems
        @user.save

        workout
    end

end