class BugsController < ApplicationController

	before_action :find_project, only: [:new, :show,:index,:create,:edit,:update,:destroy]
  before_action :find_bug, only: [ :show, :edit, :update,:destroy]

  # shows all bugs
  def index
    puts '--------------------------------------- index -----------------------------------------'
	  @bugs = @project.bugs.all
  end

  # New bug
  def new
    puts '--------------------------------------- New -----------------------------------------'

  	@bug = @project.bugs.build
  end


  # Create new bug
  def create
    puts '--------------------------------------- Create -----------------------------------------'
   #  bug_params[:creator]=current_user.name
  	@bug = @project.bugs.build(bug_params)
  	@bug.user = current_user
    # puts 'bug user  ----- '
    # puts @bug.user.name

    if @bug.save
  		redirect_to project_bugs_url
  	else
  		render 'new'
  	end
  end


  # Edit bug
  def edit
    puts '--------------------------------------- edit -----------------------------------------'

  end

  # Update existing bug
  def update
    puts '--------------------------------------- update -----------------------------------------'

  if @bug.update(bug_params)
      redirect_to project_bug_url
    else
      render 'edit'
    end
  end
 
  # shows indivisual bug
  def show
    puts '--------------------------------------- show -----------------------------------------'

  end

  # Destroy indivisual bug
  def destroy
    puts '--------------------------------------- destroy -----------------------------------------'

      @bug.destroy
      redirect_to project_bugs_url
  end

  private

  # find bug based on bug id.
  def find_bug
    puts '--------------------------------------- find bug -----------------------------------------'

    puts params
    @bug = Bug.find(params[:id])
  end

  # find project based on project id
  def find_project
    puts '--------------------------------------- fund proj -----------------------------------------'

  	@project = Project.find(params[:project_id])
  end

  # permission on parameters
  def bug_params
    puts '--------------------------------------- bug paramss -----------------------------------------'

    params.require(:bug).permit(:title,:description,:deadline,:screenshot,:status, :type,:avatar,:creator)
  end

end
