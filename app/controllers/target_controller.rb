class TargetController < ApplicationController
  def index
  end


  def update
    # Update for targets / actuals and target days
    @target = Target.find(params[:id])
    @target.update_attributes(target_params)

    redirect_to overview_index_path, :notice => "#{params.inspect}"
  end


  def edit
    # Edit for targets / actuals and target days
    date = params[:start_date] ? params[:start_date].to_date : Time.now.to_date

    @target      = Target.find(params[:id])
    @target.create_target_days(date)
  end



  private
  def target_params
    params.require(:target).permit(:name, :actuals_attributes => [:amount], :target_days_attributes => [:day, :amount])
  end
end