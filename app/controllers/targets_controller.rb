class TargetsController < ApplicationController
  def index
  end

  def update
    # Update for targets / actuals and targets days
    @target = Target.find(params[:id])
    @target.update_attributes(target_params)

    if params['target']['target_days_attributes']
      # target days updated
      redirect_to overview_index_path, :notice => "#{@target.name} targets updated!"
    else
      redirect_to overview_index_path, :notice => "updated #{@target.name}"
    end
  end


  def edit
    # Edit for targets / actuals and targets days
    date = params[:start_date] ? params[:start_date].to_date : Time.now.to_date

    @target      = Target.find(params[:id])
    @target.create_target_days(date)
  end



  private
  def target_params
    params.require(:target).permit(:name, :actuals_attributes => [:amount], :target_days_attributes => [:id, :day, :amount])
  end
end