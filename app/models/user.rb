class User < ActiveRecord::Base

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  has_many :favs
  has_many :posts,dependent: :destroy
  has_many :comments ,dependent: :destroy
  

end















#has_many :friends #, -> { where processed: true }   #no need rn
#,:through => :posts
#, -> { where processed: true }
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable