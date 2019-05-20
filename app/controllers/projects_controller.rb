class ProjectsController < ApplicationController
  before_action :find_project, except: %i[index new create]
  before_action :authorize_project_resource, except: %i[index new]

  def index
    @projects = Project.all.order('created_at DESC')
  end

  def new
    authorize Project
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'project is created'
    else
      redirect_to new_project_url, flash: { error: 'project name should be unique and non-empty' }
    end
  end

  def show
    @nusers = User.all.where.not(id: @project.users.ids)
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'project is updated'
    else
      redirect_to edit_project_url, flash: { error: 'project name field should not be empty' }
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: 'project is deleted'
  end

  def add_user
    @project.users << User.find(params[:user_id])
    redirect_to @project, notice: 'user is added to the project'
  end

  def del_user
    @project.users.delete(User.find(params[:user_id]))
    redirect_to @project, notice: 'user is removed from the project'
  end

  private

  def authorize_project_resource
    authorize @project
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_id)
  end
end
