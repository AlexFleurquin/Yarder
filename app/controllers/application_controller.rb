class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_theme
  before_action :set_projects, unless: :skip_projects?

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      # session[:theme] = theme
      cookies[:theme] = theme
      redirect_to(request.referer || root_path)
    end
  end

  def set_projects
    @projects = current_user.projects
  end

  def skip_projects?
    (controller_name == "sessions" && action_name == "new") || (controller_name == "registrations" && action_name == "new") || (action_name == "home") || (controller_name == "omniauth_callbacks") || (action_name == "self.from_omniauth")
  end
end
