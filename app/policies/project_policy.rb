class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def new?
    create?
  end

  def create?
    user.Manager?
  end

  def update?
    user.Manager?
  end

  def edit?
    update?
  end

  def destroy?
    user.Manager?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
