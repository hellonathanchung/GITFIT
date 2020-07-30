class AddNameToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :name, :string
  end
end
