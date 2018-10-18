class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @projects }
    end
  end

  def show
    @activities = @project.activities
    @activity = Activity.new
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
    respond_to :html, :json
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.save
    render json: @project, :layout => false
    # respond_to do |format|
    #   if @project.save
    #     format.html { redirect_to root_url }
    #     format.json { render json: project }
    #   else
    #     respond_to :html, :json
    #   end
    # end.
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        respond_to :html, :json
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Project destroyed.' }
      format.json { render :index }
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