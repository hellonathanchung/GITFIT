
# class CommandLine #class for CLI 

# prompt = TTY::Prompt.new
#     def welcome 
#         puts "Welcome to GITFIT"
        
#         prompt.yes?("Do you have a username?")
#     end
        
#         user_input = gets.chomp.downcase 

# if user_input == 'yes'
#     puts "What is your username?"
#     username = gets.chomp.downcase

#     if User.exists?(:name => username)
#         $user = User.find_by(name: username)
#         puts ("Welcome, #{$user.name}!").titleize #titleize capitalizes the first letter of a string
#     else 
#         puts "We could not find your username"
#         add_new_user
#     end
# else
#     add_new_user
# end

# def add_new_user
#     puts "Please create your username"
#     username = gets.chomp
#     if User.exists?(name: username)
#         puts "Username is taken, please try again"
#         add_new_user
#     else 
#         new_user = User.create(name: username)
#         $user = new_user
                
#         puts "Hello, #{$user.name.titleize}!" 
#         puts "What is your fitness level?".titleize
#         puts "Active"
#         puts "Moderate"
#         puts "Sedentary"
#         fitness_level = gets.chomp.downcase
#         $user.fitness_level = fitness_level
#         puts "Your fitness level is #{fitness_level}"
                
#     end
# end
#     # end

#     def menu 
#             require "tty-prompt"
            
#             prompt = TTY::Prompt.new
#             # new_session = "New Session"
#             # review_previous_session = "Review Previous Sessions"
#             # see_all_exercises = "See All Exercises"
#             # view_last_session = "View Last Session"
#             # choices = %w(new_session review_previous_session see_all_exercises view_last_session)
#             prompt.select("What would you like to do?") do |menu|
#                 menu.enum "."
            
#                 menu.choice "New Session",-> {new_session} 
#                 menu.choice "Review Previous Sessions",->{review_previous_sessions}
#                 menu.choice "View Last Session",->{view_last_session}
#                 menu.choice "Learn About Exercises",->{read_exercises}          
#                 def read_exercises
#                     exercises = Exercise.all 
#                     exercises.map {|exercise| "#{exercise.name} -  #{exercise.description}"}
#                 end
#             end
#         end

#                 # def select_exercise
#             Prompt = TTY::Prompt.new
#             puts "Starting a new session..."
#             prompt.select("What exercise would you like to do?") do |menu|
#                 menu.enum "."
                    
#                 menu.choice "push ups",-> {new_session} 
#                 menu.choice "pull ups",->{review_previous_sessions}
#                 menu.choice "squats",->
#                 menu.choice "leg raises",
#                 menu.choice "crunches",->
#                 menu.choice "jumping jacks",
#                     puts "great, youve picked out your exercise"
#                     puts "how many reps would you like to do?"
#                         reps = gets.chomp
#                         #how many sets would you like to do => sets
#                         sets = gets.chomp
#                         Workout.create(self, exercise_id, sets, reps )
#                 end
#                 # end

#                 # def new_session
#             puts "Starting a new session..."
#             select_exercise
#             puts "Awesome. Would you like to do another exercise?"
#             input == gets.chomp.downcase
#                 if input == yes
#                     select_exercise
#                 else
#                     puts "Goodbye!"
#                     menu
#                 end
#             end
#         # def read_exercises #workouts
#     puts "want to read through the exercises?"
#     input = gets.chomp.downcase
        
#     if input == 'yes'        
#         User.first.exercises.all.map {|exercise| "#{exercise.name} -  #{exercise.description}"}
#     end
        
#         # def find_all_workout
#         puts "Would you like to see all of your past sessions?(yes/no)"
#         user_input = gets.chomp.downcase 
#         # binding.pry
#         if user_input == 'yes'
#             $user = User.find_by(name: "Brian")
#             $user.workouts.each do |workout| 
#                 puts workout.exercise.name
#                 puts workout.exercise.description
#                 puts workout.exercise.body_part
#                 puts "#{workout.sets}  sets"
#                 puts "#{workout.reps}  reps" 
#             end
#         end
#         # end
        
#         # def review_previous_session
#     # binding.pry
#     puts "Here are your previous sessions"
#     #select workouts from the day the user did it. 

#     #What would you like to do? Prompt 
#     #edit session
#     #exit -> menu
#     #update a session
#         # end


#         # def edit_session
#     #what would you like to update?
#     #sets? (user.workouts.update(sets: value)
#     #reps? (user.workouts.update(sets: value))
#         # end 
#     # end
# # end
# # end