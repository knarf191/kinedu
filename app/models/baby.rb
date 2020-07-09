class Baby < ApplicationRecord
  has_many :activity_logs
  def age
    (Time.now.year * 12 + Time.now.month) - (birthday.year * 12 + birthday.month)
  end
end
