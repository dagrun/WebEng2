class GroupsController < ApplicationController
 before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @groups = current_user.groupss.build(groups_params)
    if @groups.save
      flash[:success] = "Group created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @group.destroy
    redirect_to root_url
  end

  private

    def groups_params
      params.require(:groups).permit(:content)
    end
		def correct_user
      @group = current_user.groups.find_by(id: params[:id])
      redirect_to root_url if @group.nil?
    end
end