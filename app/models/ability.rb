# frozen_string_literal: true

class Ability
  
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    if user.superadmin_role?
      can :manage, :all
      can :access, :active_admin       # only allow admin users to access Rails Admin
      can :manage, :dashboard         # allow access to dashboard
    end
    if user.supervisor_role?
      can :manage, User
    end

  end


end


# include CanCan::Ability

  # def initialize(user)
  #   # Define abilities for the passed in user here. For example:
  #   #
  #     user ||= User.new # guest user (not logged in)
  #     if user.admin?
  #       can :manage, :all
  #       ## edits
  #       can [:update, :read] , Admin, id: admin.id
  #     else
  #       can :read, :all
  #     end
    
   
  # end