class MembershipsController < ApplicationController
 before_action :signed_in_user, only: [:create, :destroy]
 before_action :correct_user,   only: [:create, :destroy]
  

  def create
    @membership = Membership.new(:group_id => params[:group], :user_id => params[:member] )   
    if @membership.save
      flash[:success] = "Member was added to group!"
      redirect_to current_user
    else
      flash[:error] = "Member was not added to group"
      redirect_to current_user
    end
  end

  def destroy
    Membership.find_by(:user_id => params[:member]).destroy
    flash[:success] = "Member removed."
    redirect_to current_user
  end

  private

    def membership_params
      params.require(:membership).permit(:user, :group)
    end
		def correct_user
      @group = current_user.owned_groups.find_by(id: params[:group])
      redirect_to root_url if @group.nil?
    end
end