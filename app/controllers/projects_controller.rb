class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
    @rooms = @project.rooms
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
