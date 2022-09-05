class ParticipationsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  def artisans
    @artisans = User.artisans
  end

  def artisan_show
    @artisan = User.artisan(params[:id])
  end
end
