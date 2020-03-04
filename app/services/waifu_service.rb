class WaifuService
    def initialize(user)
        @user = user
    end

    def gacha
        if(@user.gems > 0)
            @user.gems = @user.gems - 1
            @user.save
            add_waifu(generate_waifu)
            true
        else
            false
        end
    end

    def generate_waifu
        series_service = SeriesService.new(@user)
        series = series_service.generate_series

        jikan_service = JikanService.new
        characters = jikan_service.get_characters(series.mal_type, series.mal_id)
        character = characters.sample

        character.series = series
        existing_character = Waifu.where(mal_id: character.mal_id).first
        if(existing_character === nil)
            character.save
        else
            character = existing_character
        end

        character
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