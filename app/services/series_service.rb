class SeriesService
    def initialize(user)
        @user = user
    end

    def generate_series
        series = @user ? @user.series : []
        if(series.length === 0) 
            series = JikanService.new.top
        end
        series = series.sample
        if(series.id === nil) 
            check = Series.where(mal_id: series.mal_id).first
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