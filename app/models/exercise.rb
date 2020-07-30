class Exercise < ActiveRecord::Base
    has_many :workouts
    has_many :sessions, through: :workouts
    has_many :users, through: :sessions
end