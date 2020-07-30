#created using db:create_migration NAME=create_exercises

class CreateExercises < ActiveRecord::Migration[5.2]
  def change  #creates table for exercises
    create_table :exercises do |t|
    t.string :name
    t.string :description
    t.string :body_part
    end
  end
  end
