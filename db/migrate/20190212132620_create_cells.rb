class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.string :name
      t.integer :manager
      t.references :directorship, foreign_key: true

      t.timestamps
    end
  end
end
