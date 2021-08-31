class Post < ApplicationRecord
	belongs_to :user, :foreign_key => "user_id"  #means:user searching for table name user
	validates :title, presence: true, length: { in: 3..25 }
	has_one_attached :image
 	has_many :comments ,dependent: :destroy


	 #for resizing of image with miniMagik
 	def thumbnail
	 	return self.image.variant(resize: '300x300')
 	end
end
 