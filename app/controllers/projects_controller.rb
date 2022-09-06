class ProjectsController < ApplicationController
  before_action :index
  def index
    @projects = Project.all
    # if params[:query].present?
    #   @projects = policy_scope(Project).search_custom_project(params[:query])
    # else
    #   @projects = policy_scope(Project)
    # end
  end

  def show
    @projects = Project.all
    @project = Project.find(params[:id])
    @rooms = @project.rooms
    @room = Room.new
    @tasks = @room.tasks
    @professionals = current_user.professionals
    @markers = @project.geocode.map do
      {
        lat: @project.latitude,
        lng: @project.longitude,
        info_window: render_to_string(partial: "info_window", locals: { project: @project }),
        image_url: helpers.asset_url("house-solid.svg")
      }
    end

  end

  def new
    @projects = Project.all
    @project = Project.new
  end

  def create
    @projects = Project.all
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
    @project = Project.find(params[:id])
    @project.destroy
    render json: { element_id: @project.id, dom_id: "project_#{@project.id}" }
  end

  private

  def project_params
    params.require(:project).permit(:name, :address, :building_type, :construction_year, :urgency, :budget, :photo, :description)
  end

end
