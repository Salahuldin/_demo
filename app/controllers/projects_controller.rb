class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy, :add_user, :del_user]

  def index
    @projects = Project.all.order("created_at DESC")
  end

  def new
    @project = current_user.projects.build
    authorize @project
  end

  def create
    @project = current_user.projects.build(project_params)
    authorize @project
    if @project.save
      redirect_to @project, notice: 'project is created'
    else
      render 'new'
    end
  end

  def show
    @nusers = User.all.where.not(id: @project.users.ids)
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to @project, notice: 'project is updated'
    else
      render 'edit'
    end
  end

  def destroy
    authorize @project
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
