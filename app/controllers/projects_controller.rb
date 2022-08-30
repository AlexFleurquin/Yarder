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
