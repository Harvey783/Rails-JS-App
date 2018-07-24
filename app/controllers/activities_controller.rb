class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def index
    @activities = @project.activities
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = @project.activities.build(activities_params)
    if @activity.save
      redirect_to @project
    else
      render "projects/show"
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
    @activity.update(activities_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to project_path(@project)
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def activities_params
    params.require(:activity).permit(:name)
  end
end
