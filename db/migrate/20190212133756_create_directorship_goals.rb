class CreateDirectorshipGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :directorship_goals do |t|
      t.string :title
      t.boolean :status
      t.references :directorship, foreign_key: true

      t.timestamps
    end
  end
end
