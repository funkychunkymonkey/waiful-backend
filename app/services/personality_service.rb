class PersonalityService
    def initialize(user)
        @user = user
    end

    def buy(personality_id)
        if(ActiveRecord::Base.connection.select_one("SELECT COUNT(*) count FROM personalities_users WHERE user_id = #{@user.id} AND personality_id = #{personality_id}")['count'] === 0 and @user.gems >= 200)
            @user.gems = @user.gems - 200
            @user.save
            ActiveRecord::Base.connection.insert("INSERT INTO personalities_users(user_id, personality_id) VALUES(#{@user.id}, #{personality_id})")
            true
        else
            false
        end
    end

    def add(waifu_id, personality_id)            
        ActiveRecord::Base.connection.update("UPDATE users_waifus SET personality_id = #{personality_id} WHERE user_id = #{@user.id} AND waifu_id = #{waifu_id}") > 0
    end
end