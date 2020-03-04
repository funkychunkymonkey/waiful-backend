class SeriesService
    def initialize(user)
        @user = user
    end

    def add_series(series)
        @user.series << series
    end

    def remove_series(series)
        @user.series.delete(series)
    end
end