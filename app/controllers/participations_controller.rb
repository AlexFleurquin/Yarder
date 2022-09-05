class ParticipationsController < ApplicationController
  before_action :index
  def index
    @projects = Project.all
  end

  def new
  end

  def create
    # recup le projet
    @project = Project.find(params[:id])
    # recup le user params..
    @user = User.find(params[:id])
    # participation.create (participation_params en private)
    @participation.create(participation_params)
    # if save redirect to project_path(@project, tab: 'member')  => /projects/15?tab=member
    if @participation.save redirect_to project_path(@project, tab: 'member')
    end
  end

  def destroy
  end

  def artisans
    @artisans = User.artisans
    @participation = Participation.new
  end

  def artisan_show
    @artisan = User.artisan(params[:id])
  end

  private

  def participation_params
    participation_params.require(@participation).permit(:user_id, :project_id)
  end
end
