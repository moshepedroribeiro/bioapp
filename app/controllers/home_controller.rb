class HomeController < ApplicationController
  def index
    @reactors = Reactor.all

    params[:reactor] ||= @reactors.first.id

    culture = Culture.where(reactor_id: params[:reactor]).order(updated_at: :desc).first

    if culture&.culture_logs
      @culture_logs = culture&.culture_logs.order(created_at: :desc).limit(24)
      @last_culture_log = @culture_logs.last
      @culture_logs_temperature = @culture_logs.pluck(:temperature)
      @culture_logs_times = @culture_logs.map { |culture_log| culture_log.updated_at.strftime('%H:%M:%S') }
      @culture_logs_concentrations = @culture_logs.pluck(:concentration)
    else
      @culture_logs = []
      @last_culture_log = nil
      @culture_logs_temperature = []
      @culture_logs_times = []
      @culture_logs_concentrations = []
    end
  end
end

