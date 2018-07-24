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
    @project = current_user.projects.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project destroyed.' }
      format.json { render json: }
    end
  end


  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
