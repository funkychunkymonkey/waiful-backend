class Equipment < ApplicationRecord
    self.table_name = "equipments"
    has_many :exercises, through: :exercises_equipments
end
