class BugPolicy < ApplicationPolicy
 attr_reader :user, :bug

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def new?
    create?    
  end

  def create?
    user.Manager? or user.QA?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user.Manager? or user.QA?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
