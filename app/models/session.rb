class Session < ActiveRecord::Base
    has_many :workouts
    belongs_to :user
    has_many :exercises, through: :workouts
end