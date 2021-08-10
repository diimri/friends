class Post < ApplicationRecord
	belongs_to :user, :foreign_key => "user_id"
	#belongs_to :user, :optional =>true
	#means:user searching for table name user
end
