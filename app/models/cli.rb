require "tty-prompt"
class CLI #class for CLI 

    
    def welcome #ansishadowtext
        puts ("
            ██████╗ ██╗████████╗███████╗██╗████████╗
            ██╔════╝ ██║╚══██╔══╝██╔════╝██║╚══██╔══╝
            ██║  ███╗██║   ██║   █████╗  ██║   ██║   
            ██║   ██║██║   ██║   ██╔══╝  ██║   ██║   
            ╚██████╔╝██║   ██║   ██║     ██║   ██║   
             ╚═════╝ ╚═╝   ╚═╝   ╚═╝     ╚═╝   ╚═╝   
             ")
        puts "Hello! Welcome to GitFIT!"
        
            puts "please enter a username"
            username = gets.chomp.downcase.titleize
            
            if User.exists?(name: username)
                $user = User.find_by(name:username)
                puts "Looks like you have an account, #{$user.name}. Let's take you the main menu."
            else
                User.create(name: username)
                puts "Welcome! Looks like this is your first time."
                puts "Let's get some information."
                age = ask_age #sends to ask age method
                fitness_level = ask_fitness_level #gets fitness level
                $user =User.create(name:username, age: age, fitness_level: fitness_level)
                puts "Account sucessfully created. Welcome to GitFIT #{username}."
                # binding.pry
                
            end
    end
    ##################################################

    def menu
        # system "clear"
        puts ("
███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
                                                                          
            ")
        prompt = TTY::Prompt.new
        puts "Welcome to the main menu #{$user.name}"
        prompt.select("What would you like to do?") do |menu|
                menu.enum "."
                        
                menu.choice "New Session",-> {new_session} 
                menu.choice "Review Previous Sessions",->{review_previous_sessions}
                menu.choice "Edit a session",->{edit_session}
                menu.choice "Learn About Exercises",-> {read_exercises}
                menu.choice "Exit",-> {exit}
                end       
    end
#######################################################
    def ask_age #done
        prompt = TTY::Prompt.new
        age = prompt.ask("How old are you?")
    end


    def ask_fitness_level #done
        prompt = TTY::Prompt.new
        fitness_level = prompt.select("How fit are you") do |menu|
            menu.choice name: "Sedentary"
            menu.choice name: "Moderately Active"
            menu.choice name: "Beast Mode"
          end
    end

    def update_age #dont worry about this yet
        User.last.update(age)
    end
    
    def new_session
        system "clear"
        make_a_session = Session.create(user_id: $user.id, name:Time.now)
        prompt = TTY::Prompt.new
        puts ("
██╗     ███████╗████████╗███████╗     ██████╗ ███████╗████████╗    ███████╗████████╗ █████╗ ██████╗ ████████╗███████╗██████╗ 
██║     ██╔════╝╚══██╔══╝██╔════╝    ██╔════╝ ██╔════╝╚══██╔══╝    ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██║     █████╗     ██║   ███████╗    ██║  ███╗█████╗     ██║       ███████╗   ██║   ███████║██████╔╝   ██║   █████╗  ██║  ██║
██║     ██╔══╝     ██║   ╚════██║    ██║   ██║██╔══╝     ██║       ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██╔══╝  ██║  ██║
███████╗███████╗   ██║   ███████║    ╚██████╔╝███████╗   ██║       ███████║   ██║   ██║  ██║██║  ██║   ██║   ███████╗██████╔╝
╚══════╝╚══════╝   ╚═╝   ╚══════╝     ╚═════╝ ╚══════╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝ 
")
        sleep 2
        system "clear"
        puts "Let's select a workout"
# binding.pry
        new_workout
        menu
    end

    def new_workout
        input = nil
        until input == "no" do
            prompt = TTY::Prompt.new
            exercise_choice = prompt.select("What exercise would you like to do?") do |menu|
                menu.enum "."
                                    
                menu.choice "push-ups", value: 1 
                menu.choice "pull-ups", value: 2
                menu.choice "squats", value: 3
                menu.choice "leg raises", value: 4
                menu.choice "crunches", value: 5 
                menu.choice "jumping jacks", value: 6
            end
            number_of_reps = prompt.ask("How many reps did you do?")
            number_of_sets = prompt.ask("How many sets did you do?")            
            create_workout = Workout.create(session_id: $user.sessions.last.id, exercise_id:exercise_choice[:value], sets:number_of_sets, reps:number_of_reps)
            puts "Would you like to add another?"
            input = gets.chomp.downcase
        end

        answer = prompt.ask("Would you like to name this session?")
        if answer == "yes"
            name_session
            puts "Your session name is #{Session.last.name}"
        else
            puts "Your session name is #{Session.last.name}"
        end
        # system "clear"
        puts "Sending you back to main menu"
        sleep 5

        # new_workout = Exercise.create()
    end

    def name_session
        prompt = TTY::Prompt.new
        answer = prompt.ask("What would you like to name this session?")
        $user.sessions.last.update(name: answer)
        puts "Your session is now named #{answer}"
        sleep 3
        # system "clear"
        puts "Sending you back to main menu"
        menu
    end

    def read_exercises 
        input = nil
        prompt = TTY::Prompt.new
        exercise_choice = prompt.select("What exercise would you like to read about?") do |menu|
            menu.enum "."
                                
            menu.choice "push-ups", value: 1 
            menu.choice "pull-ups", value: 2
            menu.choice "squats", value: 3
            menu.choice "leg raises", value: 4
            menu.choice "jumping jacks", value: 5
            menu.choice "crunches", value: 5
        end
        
        selected_exercise = Exercise.find_by({id:exercise_choice[:value]})
        # binding.pry
            puts ("
            Exercise |#{selected_exercise.name}
            Body Part |#{selected_exercise.body_part}
            Description |#{selected_exercise.description}")

        puts "Would you like to read about another exercise?"
        input = gets.chomp.downcase
        if input == "yes"
            read_exercises
        else 
            menu
        end
    end

    def review_previous_sessions
        # binding.pry
        prompt = TTY::Prompt.new
        previous_sessions = Session.all.select{|session| session.user_id = $user.id}
        # session.each {|session| puts}

        puts "you have #{previous_sessions.count} sessions"
        list_of_previous_sessions= previous_sessions.map {|session| "#{session.name}"}

        selected_session = prompt.select("Please choose a session to review", list_of_previous_sessions)
        current_session = Session.all.find_by(name:selected_session)

        current_session.workouts.each {|workouts| puts "#{ workouts.exercise.name} sets: #{workouts.sets} reps: #{workouts.reps}"}
        
        prompt.select("What would you like to do?") do |menu|
            menu.enum "."
            menu.choice "Edit current session"
            menu.choice "Edit current session"
        # binding.pry
    end
end