class ActivitiesController < ApplicationController


  def create
    @group = Group.find(params[:group_id])
    @activity = @group.activities.create(activity_params)
    redirect_to group_path(@group)
  end

  def upvote
	  @activity = Activity.find(params[:id])
    @vote1 = Vote.find_by_id(current_user.id)
    if @vote1 == nil
      @activity.votes.create
      @vote = @activity.votes.last
      @vote.user_id = current_user.id
    end
    @group = Group.find(params[:group_id])
	  redirect_to(group_path(@group))
  end

def setdef
 @activity = Activity.find(params[:activity_id]) 
@activity.update_attribute(:definitive, true)
  redirect_to :back
end

 
  private
    def activity_params
      params.require(:activity).permit(:name, :location, :start_date, :end_date, :description, :image_url, :group_id)
    end
    
end
