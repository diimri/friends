class Friend < ActiveRecord::Base
	#belongs_to: user
	belongs_to :user,  :foreign_key => "user_id"
	#:class_name => "User",
	validates :FName, presence: true
  	validates :Insta, presence: true, length: { minimum: 10 }

end
 