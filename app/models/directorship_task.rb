class DirectorshipTask < ApplicationRecord
  belongs_to :directorship_goal
  belongs_to :user
end
