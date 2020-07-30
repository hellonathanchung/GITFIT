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
                binding.pry
                
            end
    end
    ##################################################

    def menu
        system "clear"
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
                menu.choice "View Last Session",->{view_last_session}
                menu.choice "Learn About Exercises",-> {Exercise.all.map {|exercise| "#{exercise.name} -  #{exercise.description}"}}
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
        new_session = Session.create()
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
    end
    def read_exercises
        Exercise.all.map {|exercise| "#{exercise.name} -  #{exercise.description}"}
    end
end