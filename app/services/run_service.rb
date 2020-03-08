class RunService
    def initialize(user)
        @user = user
    end

    def create
        @user.runs.create!({
          distance: 0,
          data: "",
          started_at: Time.current
        })
    end

    def end(input)
        run = @user.runs.where(ended_at: nil).first
        run.distance = input[:distance]
        run.data = input[:data]
        run.ended_at = Time.current
        run.save

        run.gems (run.distance/100).floor
        @user.gems = @user.gems + run.gems;
        @user.save
        run
    end
end