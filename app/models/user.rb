class User < ActiveRecord::Base

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends #, -> { where processed: true }

end




#, -> { where processed: true }
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable