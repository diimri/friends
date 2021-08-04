class Post < ApplicationRecord
	belongs_to :user, :foreign_key => "user_id"
	#means:user searching for table name user
end
