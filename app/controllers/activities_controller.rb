class ActivitiesController < ApplicationController
  def create
    @group = Article.find(params[:group_id])
    @activity = @group.activities.create(activity_params)
    redirect_to group_path(@group)
  end
 
  private
    def activity_params
      params.require(:activity).permit(:name, :location, :start_date, :end_date, :description, :image_url, :group)
    end
end