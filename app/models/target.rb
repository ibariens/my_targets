class Target < ActiveRecord::Base
  has_many :actuals
  has_many :target_days
  accepts_nested_attributes_for :actuals
  accepts_nested_attributes_for :target_days


  def create_target_days(date)
    (date.beginning_of_month..date.end_of_month).each do |day|
      TargetDay.find_or_create_by(:day => day, :target_id => self.id)
    end
  end
end