class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    # if params[:query].present?
    #   @projects = policy_scope(Project).search_custom_project(params[:query])
    # else
    #   @projects = policy_scope(Project)
    # end
  end

  def show
    @project = Project.find(params[:id])
    @rooms = @project.rooms
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to new_project_room_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :address, :building_type, :construction_year, :urgency, :budget, :photo, :description)
  end

end
