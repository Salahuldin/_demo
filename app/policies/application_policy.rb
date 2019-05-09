class ApplicationPolicy
  class Scope
      attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
        user_is_owner_of_project? 
  end




 private

  def user_is_owner_of_project?
    @user == @project.user
  end
  end
end
