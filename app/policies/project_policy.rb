class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def new?
    create?
  end

  def show?
    !user.developer? || project.users.ids.include?(user.id)
  end

  def create?
    user.manager?
  end

  def update?
    user.manager?
  end

  def edit?
    update?
  end

  def destroy?
    user.manager?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
