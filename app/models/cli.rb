
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
        puts "Please enter a username"
            username = gets.chomp.downcase.titleize
            
            if User.exists?(name: username)
                @user = User.find_by(name: username)
                puts "Looks like you have an account, #{@user.name}. Let's take you the main menu."
                sleep 2
            else
                User.create(name: username)
                puts "Welcome! Looks like this is your first time."
                puts "Let's get some information."
                age = ask_age #sends to ask age method
                fitness_level = ask_fitness_level #gets fitness level
                @user =User.create(name:username, age: age, fitness_level: fitness_level)
                puts "Account sucessfully created. Welcome to GitFIT #{username}."
                sleep 2
            end
    end
    ##################################################

    def main_menu
        # system "clear"
        puts ("
███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║3
██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
                                                                          
            ")
        prompt = TTY::Prompt.new
        puts "Welcome to the main menu #{@user.name}"
        prompt.select("What would you like to do?") do |menu|
                menu.enum "."
                        
                menu.choice "New Session",-> {new_session} 
                menu.choice "Review Previous Sessions",->{review_previous_sessions}
                menu.choice "Delete a Session",->{delete_session}
                menu.choice "Learn About Exercises",-> {read_exercises}
                menu.choice "Exit"
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
        make_a_session = Session.create(user_id: @user.id, name:Time.now)
        prompt = TTY::Prompt.new
        puts ("
██╗     ███████╗████████╗███████╗     ██████╗ ███████╗████████╗    ███████╗████████╗ █████╗ ██████╗ ████████╗███████╗██████╗ 
██║     ██╔════╝╚══██╔══╝██╔════╝    ██╔════╝ ██╔════╝╚══██╔══╝    ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██║     █████╗     ██║   ███████╗    ██║  ███╗█████╗     ██║       ███████╗   ██║   ███████║██████╔╝   ██║   █████╗  ██║  ██║
██║     ██╔══╝     ██║   ╚════██║    ██║   ██║██╔══╝     ██║       ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██╔══╝  ██║  ██║
███████╗███████╗   ██║   ███████║    ╚██████╔╝███████╗   ██║       ███████║   ██║   ██║  ██║██║  ██║   ██║   ███████╗██████╔╝
╚══════╝╚══════╝   ╚═╝   ╚══════╝     ╚═════╝ ╚══════╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝ 
")
        sleep 1
        system "clear"
        puts "Let's select a workout"
        new_workout
        main_menu
    end

    def new_workout
        input = nil
        until input == "no" do
            prompt = TTY::Prompt.new
            # system "clear"
            exercise_choice = prompt.select("What exercise would you like to do?") do |menu|
                menu.enum "."
                                    
                menu.choice "push-ups", value: 1 
                menu.choice "pull-ups", value: 2
                menu.choice "squats", value: 3
                menu.choice "leg raises", value: 4
                menu.choice "crunches", value: 5 
                menu.choice "jumping jacks", value: 6
                menu.choice "exit"
            end
            number_of_reps = prompt.ask("How many reps did you do?")
            puts "You did #{number_of_reps} reps"
            number_of_sets = prompt.ask("How many sets did you do?") 
            puts "You did #{number_of_sets} sets"

            create_workout = Workout.create(session_id: @user.sessions.last.id, exercise_id:exercise_choice[:value], sets:number_of_sets, reps:number_of_reps)
            sleep 2
            system "clear"
            puts "Would you like to add another workout?"
            input = gets.chomp.downcase
        end

        answer = prompt.ask("Would you like to name this session?")
        if answer.downcase == "yes"
            name_session
            puts "Your session name is #{Session.last.name}"
        else
            puts "Your session name is #{Session.last.name}"
        end
        # system "clear"
        puts "Sending you back to main menu"
        sleep 3

        # new_workout = Exercise.create()
    end

    def name_session
        prompt = TTY::Prompt.new
        answer = prompt.ask("What would you like to name this session?")
        @user.sessions.last.update(name: answer)
        if answer == "yes"
        puts "Your session is now named #{answer}"
        sleep 3
        # system "clear"
        main_menu
        else
        puts "Sending you back to main menu"
        sleep 1
        main_menu
        end
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
        system "clear"
            puts "Exercise : #{selected_exercise.name}"
            puts "Body Part : #{selected_exercise.body_part}"
            puts "Description : #{selected_exercise.description}"
            puts ""

        prompt.select("Would you like to read about another exercise?") do |menu|
        menu.choice "yes",->{read_exercises}
        menu.choice "no",->{main_menu}
        end
    end

    def review_previous_sessions
        prompt = TTY::Prompt.new
        
        # binding.pry
        if Session.all.select{|session| session.user_id == @user.id} == []
            # binding.pry
            puts "You have no previous sessions"
            sleep 2
            prompt.select("What would you like to do") do |menu|
                menu.choice "Start a session",-> {new_session}
                menu.choice "Return to menu",->{main_menu}
            end
        else 
            @previous_sessions = Session.all.select{|session| session.user_id == @user.id}
            # session.each {|session| puts}

            puts "you have #{@previous_sessions.count} sessions"
            list_of_previous_sessions= @previous_sessions.map {|session| "#{session.name}"}
            selected_session = prompt.select("Please choose a session to review", list_of_previous_sessions)
            current_session = Session.all.find_by(name:selected_session)

            @workout_info = current_session.workouts.each {|workouts| puts "#{ workouts.exercise.name} sets: #{workouts.sets} reps: #{workouts.reps}"}
            
            
            prompt.select("What would you like to edit?") do |menu|
                menu.enum "."
                menu.choice "Edit current session",-> {edit_session}
                menu.choice "Delete a session",-> {delete_session}
                menu.choice "Review other sessions",-> {review_previous_sessions}
                menu.choice "Return to main menu",->{main_menu}
            end
        end
    end

    def edit_session

        #this is where i'd ask "what workout would you like to edit?
        #lists the workouts by Session.all.find_by(user_id: = @user.id)
        #choose the workout to edit and then go into which exercise you'd like to edit
        prompt = TTY::Prompt.new
        session = Session.last

        answer = prompt.select("What would you like to edit?") do |menu|
            menu.choice name: "reps",  value: 1
            menu.choice name: "sets", value: 2
            menu.choice name: "add a workout", value: 3
            menu.choice name: "Nevermind, return to menu", value: 4
          end

          if answer == 1
            update_reps
          elsif answer == 2
            update_sets
          elsif answer == 3 
            prompt = TTY::Prompt.new
            input = nil
            until input == "no" do
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
                puts "You did #{number_of_reps} reps"

                number_of_sets = prompt.ask("How many sets did you do?") 
                puts "You did #{number_of_sets} sets"

                create_workout = Workout.create(session_id: @user.sessions.last.id, exercise_id:exercise_choice[:value], sets:number_of_sets, reps:number_of_reps)
                puts "Would you like to add another workout?"
                input = gets.chomp.downcase
            end 
            puts "Sending you to main menu"
            main_menu
          elsif answer == 4 
          main_menu
          else
            puts "Hm, please try again"
            edit_session
          end
    end


    def update_reps 
        puts "What you like to your sets to to? "
        answer = gets.chomp
        @user.sessions.last.workouts.last.update({reps:answer})
        sleep 2 
        puts "Your reps have been updated to #{answer} reps"
        sleep 2
        edit_session
    end


    def update_sets
        puts "What you like to update sets to?"
        answer = gets.chomp
        @user.sessions.last.workouts.last.update({sets:answer})
        puts "Your reps have been updated to #{answer} sets"
        # puts "Sending you to main menu"
        sleep 2
        edit_session
    end

    def delete_session
        prompt = TTY::Prompt.new
# binding.pry
        if Session.all.select{|session| session.user_id == @user.id} == []
            # binding.pry
            puts "You have no previous sessions to delete"
            sleep 2
            prompt.select("What would you like to do") do |menu|
                menu.choice "Start a session",-> {new_session}
                menu.choice "Return to menu",->{main_menu}
            end
        else
            @previous_sessions = Session.all.select{|session| session.user_id == @user.id}
            list_of_previous_sessions = @previous_sessions.map {|session| session.name}
            selected_session = prompt.select("Please choose a session to delete", list_of_previous_sessions)
            

            session_to_delete = Session.all.find_by(name:selected_session)
            answer = prompt.select("Are you sure?") do |menu|
                menu.choice "yes"
                menu.choice "no"
            # binding.pry
            end
        end
        if answer == 'yes' 
            session_to_delete.destroy
            puts ("   
                ███████ ███████ ███████ ███████ ██  ██████  ███    ██     ██████  ███████ ██      ███████ ████████ ███████ ██████  
                ██      ██      ██      ██      ██ ██    ██ ████   ██     ██   ██ ██      ██      ██         ██    ██      ██   ██ 
                ███████ █████   ███████ ███████ ██ ██    ██ ██ ██  ██     ██   ██ █████   ██      █████      ██    █████   ██   ██ 
                     ██ ██           ██      ██ ██ ██    ██ ██  ██ ██     ██   ██ ██      ██      ██         ██    ██      ██   ██ 
                ███████ ███████ ███████ ███████ ██  ██████  ██   ████     ██████  ███████ ███████ ███████    ██    ███████ ██████  
                                                                                                                                   
    This session has been deleted")
            puts "returning to main menu"
            sleep 2

        end
        main_menu
    end


    def exit_method
        puts ("
             ██████   ██████   ██████  ██████  ██████  ██    ██ ███████ ██ 
            ██       ██    ██ ██    ██ ██   ██ ██   ██  ██  ██  ██      ██ 
            ██   ███ ██    ██ ██    ██ ██   ██ ██████    ████   █████   ██ 
            ██    ██ ██    ██ ██    ██ ██   ██ ██   ██    ██    ██         
             ██████   ██████   ██████  ██████  ██████     ██    ███████ ██ 
                                                                           
                                                                           
            ")
    end
end