class CreateDirectorships < ActiveRecord::Migration[5.2]
  def change
    create_table :directorships do |t|
      t.string :name
      t.integer :director

      t.timestamps
    end
  end
end
