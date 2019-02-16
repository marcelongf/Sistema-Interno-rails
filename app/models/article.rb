class Article < ApplicationRecord
  belongs_to :user
  has_many :article_comments

  acts_as_votable
end
