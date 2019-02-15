class CreateCellGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :cell_goals do |t|
      t.string :title
      t.boolean :status
      t.text :description
      t.references :cell, foreign_key: true

      t.timestamps
    end
  end
end
