class Cell < ApplicationRecord
  belongs_to :directorship
  has_many :users
  has_many :cell_goals
end
