class BugPolicy < ApplicationPolicy
  attr_reader :user, :bug
  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def new?
    create?
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.developer?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    !user.developer?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
