class ProjectPolicy < ApplicationPolicy
  class Scope < Scope

	 attr_reader :user, :project
	 def initialize(user, project)
	    @user = user
	    @project = project
	 end


	 def resolve
	    scope.all
	 end



	 def index?
	 	false
	 end

	 def destroy? 
	 	user_is_owner_of_project? 
	 end


  end
end
