class BugsController < ApplicationController
  before_action :find_project, only: %i[new show index create edit update destroy]
  before_action :find_bug, only: %i[show edit update destroy assign_bug mark_bug]

  def index
    authorize @project, :show?
    authorize Bug
    @bugs = @project.bugs
  end

  def new
    @bug = @project.bugs.build
    authorize @bug
  end

  def create
    bug = @project.bugs.build(bug_params)
    authorize bug
    bug.user = current_user
    if bug.save
      redirect_to project_bugs_url, notice: 'new bug created'
    else
      flash[:error] = 'bug title should be unique and non-empty'
      render 'new'
    end
  end

  def edit; end

  def update
    if @bug.update(bug_params)
      redirect_to project_bug_url, notice: 'bug is updated'
    else
      flash[:error] = 'bug title field should not be empty'
      render 'edit'
    end
  end

  def show
    authorize @project, :show?
    authorize @bug
  end

  def destroy
    @bug.destroy
    redirect_to project_bugs_url, notice: 'bug is deleted'
  end

  def assign_bug
    @bug.dev_id = current_user.id
    @bug.status = 'started'
    @bug.save!
    redirect_to project_bug_url, notice: 'bug has been assigne'
  end

  def mark_bug
    @bug.status = 'resolved'
    @bug.save!
    redirect_to project_bug_url, notice: 'bug has been resolved'
  end

  private

  def find_bug
    @bug = Bug.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :screenshot, :status, :bug_type, :avatar, :creator)
  end
end
