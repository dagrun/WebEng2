class GroupsController < ApplicationController
 before_action :signed_in_user, only: [:create, :destroy]
 before_action :correct_user,   only: :destroy
  
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "Group created!"
      redirect_to root_url
    else
      flash[:error] = "Group wasn't crated"
      redirect_to root_url
    end
  end

  def destroy
    @group.destroy
    redirect_to root_url
  end

  private

    def group_params
      params.require(:group).permit(:topic, :home_town)
    end
		def correct_user
      @group = current_user.groups.find_by(id: params[:id])
      redirect_to root_url if @group.nil?
    end
end