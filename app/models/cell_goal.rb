class CellGoal < ApplicationRecord
  belongs_to :cell
  has_many :cell_tasks
end
