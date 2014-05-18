class ActivitiesController < ApplicationController


  def create
    @group = Group.find(params[:group_id])
    @activity = @group.activities.create(activity_params)
    redirect_to group_path(@group)
  end

  def upvote
	  @activity = Activity.find(params[:id])
    @activity.votes.create
    #vote = @activity.votes.create
    #vote.users << current_user
    @group = Group.find(params[:group_id])
	  redirect_to(group_path(@group))
  end



 
  private
    def activity_params
      params.require(:activity).permit(:name, :location, :start_date, :end_date, :description, :image_url, :group_id)
    end
    
end
