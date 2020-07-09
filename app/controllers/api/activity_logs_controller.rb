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
end
