class CreateCellTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :cell_tasks do |t|
      t.string :description
      t.boolean :status
      t.references :cell_goal, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
