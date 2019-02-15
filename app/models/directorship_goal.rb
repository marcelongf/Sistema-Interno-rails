class DirectorshipGoal < ApplicationRecord
  belongs_to :directorship
  has_many :directorship_tasks
end
