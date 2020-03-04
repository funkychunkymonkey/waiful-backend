class WaifuService
    def initialize(user)
        @user = user
    end

    def gacha
        if(@user.gems > 0)
            @user.gems = @user.gems - 1
            @user.save
            waifu = generate_waifu
            add_waifu(waifu)
            waifu
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

    def favorite_waifu(waifu, value = true)
        ActiveRecord::Base.connection.execute("UPDATE users_waifus SET is_favorite = #{value} FROM waifus WHERE users_waifus.user_id = #{@user.id} AND users_waifus.waifu_id = waifus.id AND waifus.mal_id = #{waifu[:mal_id]}") 
    end
end