class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :exercise_id
      t.integer :session_id
      t.integer :sets
      t.integer :reps

      t.timestamps
    end

  end
end
