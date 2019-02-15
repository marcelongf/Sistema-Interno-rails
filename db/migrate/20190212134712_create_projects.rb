class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :pmo
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
