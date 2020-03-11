class MuscleGroup < ApplicationRecord
    has_and_belongs_to_many :muscles, through: :muscle_muscle_group 
end
