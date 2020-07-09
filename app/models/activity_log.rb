class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  validates :baby_id, :activity_id, :assistant_id, :start_time, presence: true
end
