class Series < ApplicationRecord
    has_many :waifus
    has_and_belongs_to_many :users

    def mal_type
        is_anime ? "anime" : "manga"
    end
end
