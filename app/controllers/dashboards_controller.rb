class DashboardsController < ApplicationController
  def mydashboard
    @projects = Project.all
  end
end
