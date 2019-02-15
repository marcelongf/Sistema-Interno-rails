class Directorship < ApplicationRecord
    has_many :directorship_goals
    has_many :cells
    has_many :users
end
