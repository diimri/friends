class ApplicationController < ActionController::Base
	 #before_action :authenticate_user!, :only => [:index]
 	def fav_text
 		return @fav_exists ? "unfav" : "fav"
	end


	helper_method :fav_text
end



#<!--<% if friend.user == current_user %>>  
# from idex.html