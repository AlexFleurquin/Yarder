class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_theme
  before_action :set_projects, unless: :skip_projects?
  before_action :configure_permitted_parameters, if: :devise_controller?

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
    (controller_name == "sessions" && action_name == "new") || (controller_name == "registrations" && action_name == "new") || (action_name == "home") || (controller_name == "omniauth_callbacks")
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :avatar_url])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :avatar_url])
  end
end
