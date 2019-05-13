class BugsController < ApplicationController

	before_action :find_project, only: [:new, :show,:index,:create,:edit,:update,:destroy]
  before_action :find_bug, only: [ :show, :edit, :update,:destroy, :assign_bug, :mark_bug]

  # shows all bugs
  def index
	  @bugs = @project.bugs
  end

  # New bug
  def new
  	@bug = @project.bugs.build
    authorize @bug
  end


  # Create new bug
  def create
  	bug = @project.bugs.build(bug_params)
    authorize bug
  	bug.user = current_user
    if bug.save
  		redirect_to project_bugs_url , notice: 'new bug created'
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
      redirect_to project_bug_url ,notice: 'bug is updated'
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
      redirect_to project_bugs_url ,notice: 'bug is deleted'
  end

  def assign_bug
    @bug.dev_id = current_user.id
    @bug.status = "Started"
    @bug.save!
    redirect_to project_bug_url ,notice: 'bug has been assigne'
  end

  def mark_bug
    @bug.status = "Resolved"
    @bug.save!
    redirect_to project_bug_url  ,notice: 'bug has been resolved'
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
