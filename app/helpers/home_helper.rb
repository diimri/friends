module HomeHelper

end


# app/helpers/user_helper.rb

# module UserHelper
#   def format_name(user)
#     if user.gender == "M"
#       "Mr. #{user.name}"
#     else
#       "Ms. #{user.name}"
#     end
#   end
# end

# I got this from google how to use helper functions
# The main benefit?

# You don’t have to repeat this logic in other views when you need it & when you need to change the code… it only has to change in one place.

# Very nice!

# Using Your New Helper Module
# You can use your helper methods in your views.
# <%= format_name(@user) %>    in views

# class UsersController                     in controller
#   def index
#     helpers.time_ago_in_words(Time.now)
#   end
# end