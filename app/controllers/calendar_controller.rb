class CalendarController < ApplicationController
  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # Or, for a weekly view:
    @tasks = Task.all
    @tasks = Task.where(starts_at: Time.now.beginning_of_week..Time.now.end_of_week)


  end
end
