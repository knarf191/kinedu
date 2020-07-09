class Api::ActivityLogsController < ApplicationController
  skip_before_action :verify_authenticity_token
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

  def update
    begin
      activity_log = ActivityLog.find(params[:id])
      stop_date = DateTime.parse(params[:activity_log][:stop_time])
      if stop_date.utc > activity_log.start_time
        params[:activity_log][:duration] = activity_log.estimate_duration(params[:activity_log][:stop_time],activity_log.start_time)
        activity_log.update(activity_logs_params)
        respond serializer: ActivityLogsSerializer.new(activity_log).data, status: 200
      else
        respond serializer: 'La fecha y hora de fin debe ser mayor a la fecha y hora de inicio', status: 406
      end
    rescue StandardError => e
      respond serializer: e.message, status: 400
    end
  end

  private
  def activity_logs_params
    params.require(:activity_log).permit(:baby_id, :activity_id, :assistant_id, :start_time, :stop_time, :duration, :comments)
  end
end
