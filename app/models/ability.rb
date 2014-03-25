class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new
    can [:edit, :update, :show], Conversation do |conv|
      user.conversations.include? conv
    end
    can [:new, :create, :index], Conversation
    can :manage, Message do |message|
      (user.conversations.include? message.conversation) || message.conversation.nil?
    end
    if user.is_a? Photographer
      can [:show, :index], Event
      can [:new, :create], EventRequest
      can [:show, :destroy], EventRequest do |request|
        user.event_requests.include? request
      end
      can :destroy, Image::Portfolio do |image|
        image.photographer == user
      end
    end
    if user.is_a? Customer
      can [:new, :create], Event
      can [:edit, :update, :destroy, :index, :show], Event do |event|
        event.customer == user
      end
      can [:show, :index], EventRequest do |request|
        user.events.include? request.event
      end
    end
  end
end
