module Mutations
  class CreateExercise < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :muscles, [String], required: true
    argument :equipment, [String], required: true

    type Boolean

    def resolve(input)
      puts input
      exercise = Exercise.create!({
          :user_id => context[:user].id,
          :name => input[:name],
          :description => input[:description],
      })
      input[:muscles].each do |muscle| 
        if(muscle == "Front") then
          exercise.muscles << Muscle.find(6)
        elsif(muscle == "Arms") then
          exercise.muscles << Muscle.find(1)
        elsif(muscle == "Back") then
          exercise.muscles << Muscle.find(9)
        else
          exercise.muscles << Muscle.find(10)
        end
      end
      input[:equipment].each do |equipment| 
          exercise.equipments << Equipment.where(name:equipment).first
      end
    end
  end
end 