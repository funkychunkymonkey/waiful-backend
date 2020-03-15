class BonusService
    def initialize(user)
        @user = user
    end

    def add_bonus(gems)
        @user.gems = @user.gems + gems
        @user.save
    end

end
