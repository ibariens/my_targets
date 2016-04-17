class TargetDay < ActiveRecord::Base
  belongs_to :target_days

  # For simple calendar
  def start_time
    self.day
  end
end