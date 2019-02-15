class CreateDirectorshipTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :directorship_tasks do |t|
      t.references :directorship_goal, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :status
      t.text :description

      t.timestamps
    end
  end
end
