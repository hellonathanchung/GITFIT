class Workout < ActiveRecord::Base
    belongs_to :session
    belongs_to :exercise
end