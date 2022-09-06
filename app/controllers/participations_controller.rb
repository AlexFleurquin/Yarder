class ParticipationsController < ApplicationController
  before_action :index
  def index
    @projects = Project.all
  end

  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @user = User.find(params[:participation][:user_id])
    @participation = Participation.new(participation_params)
    @participation.user = @user
    @participation.project = @project
    if @participation.save
      redirect_to project_path(@project, tab: 'nav-professionals')
    else
      redirect_to artisans_path(artisans)
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    authorize @participation
    redirect_to project_path(@project, tab: 'nav-professionals')
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
    params.require(:participation).permit(:user_id, :project_id)
  end
end
