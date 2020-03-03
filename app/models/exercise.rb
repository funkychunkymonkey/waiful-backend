class Exercise < ApplicationRecord
  belongs_to :exercise_category
  has_many :exercise_image
end
