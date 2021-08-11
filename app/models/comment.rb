class Comment < ApplicationRecord
  belongs_to :posts
  belongs_to :user #, :through => :posts 
  validates_associated :posts
end
