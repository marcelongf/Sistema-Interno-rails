class Ability
  include CanCan::Ability

  def initialize(user)
    
    user = User.new

    if user.kind == 'member'
      can :read, :create, Article
      can :read, :create, ArticleComment
      can :read, :create, Post
      can :read, :create, PostComment
      can :update, DirectorshipTask
      can :update, CellTask
      can :read, Directorship
      can :read, Cell
    end

    if user.kind == 'director'
      can :manage, Article
      can :manage, Post
      can :manage, PostComment
      can :manage, Directorship
      can :manage, DirectorshipGoal
      can :manage, DirectorshipTask
      can :manage, Cell
    end

    if user.kind == 'cell_manager'
      can :manage, Article
      can :manage, ArticleComment
      can :manage, Post
      can :manage, PostComment
      can :update, DirectorshipTask
      can :read, Directorship
      can :manage, Cell
      can :manage, CellGoal
      can :manage, CellTask
    end

    if user.kind == 'gp_director'
      can :manage, Article
      can :manage, ArticleComment
      can :manage, Post
      can :manage, PostComment
      can :update, DirectorshipTask
      can :read, Directorship
      can :manage, Cell
      can :manage, CellGoal
      can :manage, CellTask
      can :manage, User
    end

    if user.kind == 'pmo_manager'
      can :manage, Article
      can :manage, ArticleComment
      can :manage, Post
      can :manage, PostComment
      can :update, DirectorshipTask
      can :read, Directorship
      can :manage, Cell
      can :manage, CellGoal
      can :manage, CellTask
      can :manage, Project
    end

    if user.kind == 'project_director'
      can :manage, Article
      can :manage, ArticleComment
      can :manage, Post
      can :manage, PostComment
      can :update, DirectorshipTask
      can :manage, Directorship
      can :manage, DirectorshipGoal
      can :manage, Cell
      can :manage, CellGoal
      can :manage, CellTask
      can :manage, Project
    end

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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
