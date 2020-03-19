class Series < ApplicationRecord
    has_many :waifus
    has_and_belongs_to_many :users
    attr_accessor :episodes
    attr_accessor :type
    attr_accessor :start_date
    attr_accessor :end_date
    attr_accessor :score

    def mal_type
        is_anime ? "anime" : "manga"
    end
end
