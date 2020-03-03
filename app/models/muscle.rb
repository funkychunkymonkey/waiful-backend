class Muscle < ApplicationRecord
    has_many :exercises, through: :exercises_muscles
end
