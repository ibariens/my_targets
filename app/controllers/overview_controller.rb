class OverviewController < ApplicationController
  def index
    @time_period = (params[:time_period] && (VALID_TIME_PERIODS.include? params[:time_period])) || "week"
    @targets = Target.all
  end
end