class WaifuService
    def initialize(user)
        @user = user
    end

    def gacha
        if(@user.gems > 0)
            @user.gems = @user.gems - 20
            @user.save
            waifu = generate_waifu
            waifu = add_waifu(waifu)
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
        rows = ActiveRecord::Base.connection.update("UPDATE users_waifus SET level = level + 1, updated_at = NOW() FROM waifus WHERE users_waifus.user_id = #{@user.id} AND users_waifus.waifu_id = waifus.id AND waifus.mal_id = #{waifu.mal_id}") 
        if(rows == 0)
            @user.waifus << waifu
            waifu.level 1
        else 
            waifu.level 0
        end
        waifu
    end

    def remove_waifu(waifu)
        gems = @user.waifus.where(mal_id: waifu.mal_id).size
        @user.waifus.delete(waifu)
        gems
    end

    def sell_waifu(waifu)
        gems = remove_waifu(waifu)
        @user.gems = @user.gems + gems
        @user.save
        gems
    end

    def favorite_waifu(waifu, value = true)
        ActiveRecord::Base.connection.execute("UPDATE users_waifus SET is_favorite = #{value} FROM waifus WHERE users_waifus.user_id = #{@user.id} AND users_waifus.waifu_id = waifus.id AND waifus.mal_id = #{waifu[:mal_id]}") 
    end
end