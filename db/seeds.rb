ActiveRecord::Base.connection.execute("TRUNCATE equipments, equipments_exercises, exercise_categories, exercise_images, exercises, exercises_muscles, muscles, muscle_groups, muscle_groups_muscles, personalities_users, runs, users, users_waifus, waifus, waifu_images, workouts, series, series_users")

muscle_groups = JSON.parse(File.read('./db/json/muscle_groups.json'))
muscle_groups.each do |muscle_group|
  MuscleGroup.create!({
      :id => muscle_group['id'],
      :name => muscle_group['name']
  })
end

muscle_groups_muscles = [];
muscles = JSON.parse(File.read('./db/json/muscles.json'))
muscles.each do |muscle|
  newMuscle = Muscle.create!({
      :id => muscle['id'],
      :name => muscle['name']
  })
  muscle["group"].each do |group| 
    muscle_groups_muscles <<  "(#{newMuscle.id}, #{group})"
  end
end
ActiveRecord::Base.connection.execute( "INSERT INTO muscle_groups_muscles (muscle_id, muscle_group_id) VALUES #{muscle_groups_muscles.join(", ")}") 


categories = JSON.parse(File.read('./db/json/exerciseCategories.json'))
categories.each do |category|
    ExerciseCategory.create!({
      :id => category['id'],
      :name => category['name']
  })
end

equipments = JSON.parse(File.read('./db/json/equipments.json'))
equipments.each do |equipment|
    Equipment.create!({
      :id => equipment['id'],
      :name => equipment['name']
  })
end


exercises = JSON.parse(File.read('./db/json/exercises.json'))
existing_exercises = []
exercise_muscles = []
exercise_equipments = []
exercises.each do |exercise|
  if(exercise["language"] == 2 )
    newExercise = Exercise.create!({
      :id => exercise['id'],
      :name => exercise['name'],
      :description => exercise['description']
    })
    existing_exercises << exercise['id']
    exercise["muscles"].each do |muscle|
        exercise_muscles <<  "(#{newExercise.id}, #{muscle})"
    end
    exercise["equipment"].each do |equipment|
      if(equipment != 7)
        exercise_equipments <<  "(#{newExercise.id}, #{equipment})"
      end
    end
  end
end

ActiveRecord::Base.connection.execute( "INSERT INTO exercises_muscles (exercise_id, muscle_id) VALUES #{exercise_muscles.join(", ")}") 
ActiveRecord::Base.connection.execute( "INSERT INTO equipments_exercises (exercise_id, equipment_id) VALUES #{exercise_equipments.join(", ")}")

exerciseImages = JSON.parse(File.read('./db/json/exerciseImages.json'))
exerciseImages.each do |image|
  if(existing_exercises.include? image['exercise'])
    newImage = ExerciseImage.create!({
      :id => image['id'],
      :exercise_id => image['exercise'],
      :path => image['image'],
      :is_main => image['is_main']
    })
  end
end