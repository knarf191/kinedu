class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  def estimate_duration(a,b)
    stop_time = Time.parse(a.to_time.iso8601)
    start_time = Time.parse(b.to_time.iso8601)
    duration = ((stop_time-start_time)/60).to_i
  end
end
