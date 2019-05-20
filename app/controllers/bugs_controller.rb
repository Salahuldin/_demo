class BugsController < ApplicationController
  before_action :find_project, except: %i[mark_bug assign_bug]
  before_action :find_bug, except: %i[index new create]
  before_action :authorize_bug_resource, except: %i[new index]
  before_action :authorize_project_resource, only: %i[show index]

  def index
    @bugs = @project.bugs
  end

  def show; end

  def new
    authorize Bug
    @bug = @project.bugs.build
  end

  def create
    bug = @project.bugs.build(bug_params)
    bug.user_id = current_user.id
    if bug.save
      redirect_to project_bugs_url, notice: 'new bug created'
    else
      redirect_to new_project_bug_url, flash: { error: 'bug title should be unique and non-empty' }
    end
  end

  def edit; end

  def update
    if @bug.update(bug_params)
      redirect_to project_bug_url, notice: 'bug is updated'
    else
      redirect_to edit_project_bug_url, flash: { error: 'bug title field should not be empty' }
    end
  end

  def destroy
    @bug.destroy
    redirect_to project_bugs_url, notice: 'bug is deleted'
  end

  def assign_bug
    @bug.update(developer: current_user, status: 'started')
    redirect_to project_bug_url, notice: 'bug has been assigne'
  end

  def mark_bug
    @bug.resolved!
    redirect_to project_bug_url, notice: 'bug has been resolved'
  end

  private

  def authorize_project_resource
    authorize @project, :show?
  end

  def authorize_bug_resource
    authorize @bug
  end

  def find_bug
    @bug = Bug.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :status, :bug_type, :avatar)
  end
end
