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
    @markers = @project.geocode do
      {
        lat: project.latitude,
        lng: project.longitude,
        info_window: render_to_string(partial: "info_window", locals: { project: project }),
        image_url: helpers.asset_url("house-solid")
      }
    end
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
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:name, :address, :building_type, :construction_year, :urgency, :budget, :photo, :description)
  end

end
