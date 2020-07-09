class ActivityLogsController < ApplicationController
  def index
    @activities_log = ActivityLog.order(start_time: :desc)
    respond
  end
end
