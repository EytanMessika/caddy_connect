class ActivitiesController < ApplicationController

  def update
    @activity = PublicActivity::Activity.find(params[:id])
    @activity.read_at = Date.today
    @activity.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

end
