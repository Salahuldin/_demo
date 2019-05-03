class BugsController < ApplicationController

	before_action :find_project, only: [:new, :show,:index,:create,:edit,:update]

  before_action :find_bug, only: [ :show, :edit, :update]
  def index
	@bugs = @project.bugs.all
  end
  def new
  	@bug = @project.bugs.build
  end

  def create
  	@bug = @project.bugs.build(bug_params)
  	if @bug.save
  		redirect_to project_bugs_url
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  if @bug.update(bug_params)
      redirect_to project_bug_url
    else
      render 'edit'
    end
  end
 
  def show

  end


  private

  def find_bug
    puts params
    @bug = Bug.find(params[:id])
  end
  def find_project
  	@project = Project.find(params[:project_id])
  end

  def bug_params
    params.require(:bug).permit(:title,:description,:deadline,:screenshot,:status, :type,:avatar)
  end

end
