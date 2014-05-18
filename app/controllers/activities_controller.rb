class ActivitiesController < ApplicationController


  def create
    @group = Group.find(params[:group_id])
    @activity = @group.activities.create(activity_params)
    #@activity.group_id = @group[:id]
    redirect_to group_path(@group)
  end

  def upvote
	  @activity = Activity.find(params[:id])
	  @activity.votes.create
	  redirect_to(activities_path)
  end



 
  private
    def activity_params
      params.require(:activity).permit(:name, :location, :start_date, :end_date, :description, :image_url, :group)
    end
    
end
