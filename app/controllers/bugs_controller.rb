class BugsController < ApplicationController
  before_action :find_project, only: [:new, :show, :index, :create, :edit, :update, :destroy]
  before_action :find_bug, only: [:show, :edit, :update, :destroy, :assign_bug, :mark_bug]

  def index
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
      render 'new'
    end
  end

  def edit; end

  def update
    if @bug.update(bug_params)
      redirect_to project_bug_url, notice: 'bug is updated'
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @bug.destroy
    redirect_to project_bugs_url, notice: 'bug is deleted'
  end

  def assign_bug
    @bug.dev_id = current_user.id
    @bug.status = 'Started'
    @bug.save!
    redirect_to project_bug_url, notice: 'bug has been assigne'
  end

  def mark_bug
    @bug.status = 'Resolved'
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