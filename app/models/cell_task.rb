class CellTask < ApplicationRecord
  belongs_to :cell_goal
  belongs_to :user
end
