class Exercise < ApplicationRecord
  belongs_to :exercise_category
  has_many :exercise_images
  has_and_belongs_to_many :muscles, through: :exercises_muscles
  has_and_belongs_to_many :equipments, through: :equipments_exercises 
end
