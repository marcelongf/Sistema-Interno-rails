class AddDescriptionToDirectorshipGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :directorship_goals, :description, :text
  end
end
