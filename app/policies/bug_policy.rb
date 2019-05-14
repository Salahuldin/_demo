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
    user.manager? || user.qa?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user.manager? || user.qa?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
