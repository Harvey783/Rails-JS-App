class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def index
  end

  def show
  end

  def new
  end

  def edit
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end


  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def activities_params
    params.require(:activity).permit(:name)
  end
end
