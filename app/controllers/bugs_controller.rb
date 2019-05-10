class BugsController < ApplicationController

	before_action :find_project, only: [:new, :show,:index,:create,:edit,:update,:destroy]
  before_action :find_bug, only: [ :show, :edit, :update,:destroy, :assign_bug, :mark_bug]

  # shows all bugs
  def index
	  @bugs = @project.bugs.all
  end

  # New bug
  def new
  	@bug = @project.bugs.build
  end


  # Create new bug
  def create
  	@bug = @project.bugs.build(bug_params)
  	@bug.user = current_user
    if @bug.save
  		redirect_to project_bugs_url
  	else
  		render 'new'
  	end
  end


  # Edit bug
  def edit

  end

  # Update existing bug
  def update
  if @bug.update(bug_params)
      redirect_to project_bug_url
    else
      render 'edit'
    end
  end
 
  # shows indivisual bug
  def show
  end

  # Destroy indivisual bug
  def destroy
      @bug.destroy
      redirect_to project_bugs_url
  end

  def assign_bug
    @bug.dev_id = current_user.id
    @bug.status = "Started"
    @bug.save!
    redirect_to project_bug_url
  end

  def mark_bug
    @bug.status = "Resolved"
    @bug.save!
    redirect_to project_bug_url  
  end 

  private

  # find bug based on bug id.
  def find_bug
    puts params
    @bug = Bug.find(params[:id])
  end

  # find project based on project id
  def find_project
  	@project = Project.find(params[:project_id])
  end

  # permission on parameters
  def bug_params
    params.require(:bug).permit(:title,:description,:deadline,:screenshot,:status, :bug_type,:avatar,:creator)
  end

end
