class User < ApplicationRecord
    has_and_belongs_to_many :series
    has_and_belongs_to_many :waifus, -> { select("waifus.*, users_waifus.level, users_waifus.created_at, users_waifus.is_favorite, users_waifus.personality_id") }
    has_many :runs
    has_many :workouts

    def personalities
        ActiveRecord::Base.connection.select_all("SELECT * FROM personalities_users WHERE user_id = #{id}")
    end

    def current_run
        runs.where(ended_at:nil).first
    end
end
