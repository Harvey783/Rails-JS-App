class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    respond_to :html, :json
  end

  def show
    @activities = @project.activities
    @activity = Activity.new
  end

  def new
    @project = current_user.projects.new
    respond_to :html, :json
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end


  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
