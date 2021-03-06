module Types
  class ExerciseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :userId, Int, null: true
    
    field :muscles, [MuscleType], null: false
    field :exercise_images, [ExerciseImageType], null: false
    field :equipments, [EquipmentType], null: false 

    field :exercise_image, ExerciseImageType, null: true
    def exercise_image 
      object.exercise_images.where(is_main:true).first
    end
  end
end
