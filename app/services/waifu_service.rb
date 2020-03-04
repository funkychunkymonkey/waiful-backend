class WaifuService
    def initialize(user)
        @user = user
    end

    def add_waifu(waifu)
        @user.waifus << waifu
    end

    def remove_waifu(waifu)
        @user.waifus.delete(waifu)
    end

    def favorite_waifu(waifu)
        ActiveRecord::Base.connection.execute("UPDATE users_waifus SET is_favorite = TRUE WHERE waifu_id = #{waifu.id} AND user_id = #{@user.id}") 
    end

    def unfavorite_waifu(waifu)
        ActiveRecord::Base.connection.execute("UPDATE users_waifus SET is_favorite = FALSE WHERE waifu_id = #{waifu.id} AND user_id = #{@user.id}") 
    end
end