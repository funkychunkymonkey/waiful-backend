class User < ApplicationRecord
    has_and_belongs_to_many :series
    has_and_belongs_to_many :waifus
end
