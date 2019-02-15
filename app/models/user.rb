class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :cell, optional: true
  belongs_to :directorship, optional: true
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :skills
  has_many :articles
  has_many :posts 
  has_many :article_comments
  has_many :post_comments
  has_many :directorship_tasks
  has_many :cell_tasks


  enum kind: { 
    member: 0,
    gp_director: 1,
    director: 2,
    project_director: 3,
    pmo_manager: 4,
    cell_manager: 5
}
end
