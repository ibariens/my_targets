module TargetHelper
  def get_sum_of_period(ar, time_period)
    raise("please use one of the following time periods: #{VALID_TIME_PERIODS.join(', ')}") unless VALID_TIME_PERIODS.include? time_period

    # target uses a day, actuals use updated_at
    date_column = ar.try(:first).try(:day) ? :day : :updated_at
    range = (Date.current.send("beginning_of_#{time_period}")+1.minute)..Date.current.send("end_of_#{time_period}")

    ar.send("group_by_#{time_period}", *[date_column, {range: range, last: 0}]).sum(:amount).try(:first).try(:last)
  end
end