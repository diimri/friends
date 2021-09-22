class Post < ApplicationRecord
	belongs_to :user, :foreign_key => "user_id"  #means:user searching for table name user
	validates :title, presence: true, length: { in: 3..25 }
	has_one_attached :image
	 has_many :comments ,dependent: :destroy
end
 