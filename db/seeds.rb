#This is all test data

nathan = User.create(name: 'Nathan', age: 27, fitness_level: 'moderate')
darius = User.create(name: 'Darius', age: 23, fitness_level: 'active')

pushup = Exercise.create(name: 'Push up', description: 'Push your body up and away from the ground', body_part: 'Chest')
pullup = Exercise.create(name: 'Pull up', description: 'The pull-up is a closed-chain movement where the body is suspended by the hands and pulls up.', body_part: 'Back')
squat = Exercise.create(name: 'Squat', description: 'A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up', body_part: 'Legs')
leg_raise= Exercise.create(name: 'Leg raise', description: 'The leg raise is a strength training exercise which targets the iliopsoas. Because the abdominal muscles are used isometrically to stabilize the body during the motion, leg raises are also often used to strengthen the rectus abdominis muscle and the internal and external oblique muscles.', body_part: 'Core')
jumping_jacks = Exercise.create(name: 'Jumping jacks', description: 'A jumping jack, also called side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide and the hands going overhead, sometimes in a clap, and then returning to a position with the feet together and the arms at the sides.', body_part: 'Total')
crunches = Exercise.create(name: 'Crunches', description: 'The crunch is a classic core exercise. It specifically trains your abdominal muscles, which are part of your core. ... It also includes your oblique muscles on the sides of your trunk, as well as the muscles in your pelvis, lower back, and hips. Together, these muscles help stabilize your body.', body_part: 'Chest')
# pull_up = Exercise.create(name: 'Pull Up')

# one whole session
workout1 = Workout.create(session_id: 1, exercise_id: 1, sets: 20, reps: 5)
workout2 = Workout.create(session_id: 1, exercise_id: 2, sets: 10, reps: 10)
workout3 = Workout.create(session_id: 1, exercise_id: 3, sets: 20, reps: 20)
workout4 = Workout.create(session_id: 1, exercise_id: 4, sets: 10, reps: 20)
workout5 = Workout.create(session_id: 1, exercise_id: 5, sets:5, reps: 20)
workout6 = Workout.create(session_id: 1, exercise_id: 6, sets:5, reps: 20)
