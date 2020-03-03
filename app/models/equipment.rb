class Equipment < ApplicationRecord
    has_many :exercises, through: :exercises_equipments
end
