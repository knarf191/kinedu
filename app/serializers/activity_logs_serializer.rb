class ActivityLogsSerializer < MainSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :baby_id, :start_time, :stop_time

  attribute :teacher_name do |activity_log|
    activity_log.assistant.name
  end
end
