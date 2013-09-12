class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new #if you fold students into users
    can :manage, Survey do |survey|
      survey.user_id == user.id
    end
    can :manage, User do |any_user|
      any_user.id == user.id
    end
  end
end