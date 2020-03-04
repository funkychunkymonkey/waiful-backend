ActiveRecord::Base.connection.execute("TRUNCATE equipments, equipments_exercises, exercise_categories, exercise_images, exercises, exercises_muscles, muscles, runs, users, workouts")

muscles = JSON.parse(File.read('./db/json/muscles.json'))
muscles.each do |muscle|
  Muscle.create!({
      :id => muscle['id'],
      :name => muscle['name']
  })
end

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
exercise_muscles = []
exercise_equipments = []
exercises.each do |exercise|
    newExercise = Exercise.create!({
      :id => exercise['id'],
      :name => exercise['name'],
      :description => exercise['description'],
      :exercise_category_id => exercise['category']
    })
    exercise["muscles"].each do |muscle|
        exercise_muscles <<  "(#{newExercise.id}, #{muscle})"
    end
    exercise["equipment"].each do |equipment|
        exercise_equipments <<  "(#{newExercise.id}, #{equipment})"
    end
end

ActiveRecord::Base.connection.execute( "INSERT INTO exercises_muscles (exercise_id, muscle_id) VALUES #{exercise_muscles.join(", ")}") 
ActiveRecord::Base.connection.execute( "INSERT INTO equipments_exercises (exercise_id, equipment_id) VALUES #{exercise_equipments.join(", ")}")
