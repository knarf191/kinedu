class Api::ActivityLogsController < ApplicationController
  def index
    begin
      baby = Baby.find(params[:baby_id])
      activity_logs = baby.activity_logs
      respond serializer: ActivityLogsSerializer.new(activity_logs).collection_attr_array, status: 200
    rescue StandardError => e
      respond serializer: e.message, status: 400
    end
  end

  def create
    begin
      activity_log = ActivityLog.create(activity_logs_params)
      respond serializer: ActivityLogsSerializer.new(activity_log).data, status: 201
    rescue StandardError => e
      respond serializer: e.message, status: 400
    end
  end

  private
  def activity_logs_params
    params.require(:activity_log).permit(:baby_id, :activity_id, :assistant_id, :start_time, :stop_time)
  end
end
