class User < ApplicationRecord
    has_and_belongs_to_many :series
    has_and_belongs_to_many :waifus, -> { select("waifus.*, users_waifus.level, users_waifus.created_at, users_waifus.is_favorite") }
    has_many :runs
    has_many :workouts
end
