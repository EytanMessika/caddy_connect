class ActivitiesController < ApplicationController

  def update
    PublicActivity::Activity.where(id: params[:id])

  end

end
