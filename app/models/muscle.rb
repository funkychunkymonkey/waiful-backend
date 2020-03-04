class Muscle < ApplicationRecord
    has_and_belongs_to_many :exercises, through: :exercises_muscles
end
