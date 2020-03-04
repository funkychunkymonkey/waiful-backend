class Equipment < ApplicationRecord
    self.table_name = "equipments"
    has_and_belongs_to_many :exercises, through: :exercises_equipments
end
