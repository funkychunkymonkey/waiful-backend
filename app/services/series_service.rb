class SeriesService
    def initialize(user)
        @user = user
    end

    def get_series(mal_type, mal_id)
        series = Series.where(mal_id: mal_id, is_anime: mal_type === "anime").first
        if(!series) 
            service = JikanService.new
            series = service.get(mal_type, mal_id)
            series.save
        end
        series
    end

    def generate_series
        series = @user ? @user.series : []
        if(series.length === 0) 
            series = JikanService.new.top
        end

        series = series.sample
        if(series.id === nil) 
            check = Series.where(mal_id: series.mal_id, is_anime: series.is_anime).first
            if(check === nil)
                series.save
            else
                series = check
            end
        end
        
        series
    end

    def add_series(series)
        @user.series << series
    end

    def remove_series(series)
        @user.series.delete(series)
    end
end