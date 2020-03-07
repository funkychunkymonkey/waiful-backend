class Muscle < ApplicationRecord
    has_and_belongs_to_many :exercises, through: :exercises_muscles
    has_and_belongs_to_many :muscle_groups, through: :muscle_groups_muscles 
end
