class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #if you fold students into users
    can :manage, Survey, :user_id => user.id
    can :manage, User, :id => user.id

    # can :read, :all
    # can :manage, User do |this_user| 
    #   this_user.email == user.email
    # end
  end
end