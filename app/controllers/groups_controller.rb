class GroupsController < ApplicationController
 before_action :signed_in_user, only: [:create, :destroy]
 before_action :correct_user,   only: [:destroy, :edit, :update]
  
  def show
    @group = Group.find(params[:id])
    @members = @group.users 
    if @group.activities.count == 0
      @activities = @group.activities.build
    else
      @activities = @group.activities.last
    end
  end
  
   def search
   @group = Group.find(params[:id])
   amount_images = 6
   i = 0
   results = flickr.photos.search(:api_key => MY_KEY, :tags => params[:search], :per_page => amount_images, :tag_mode => 'all')
   list_url = [amount_images]
   results.each do |r|
     info = flickr.photos.getInfo(:photo_id => r.id)
     url = FlickRaw.url_b(info)
     list_url[i] = url
     i += 1
   end
   Rails.cache.write('list_url', list_url)
   redirect_to group_path(@group.id)
 end
  
  
  def new
    @group = Group.new
    @users = User.all
    @users.delete(current_user)
  end
  
  def create
    @group = current_user.owned_groups.build(group_params)
    if(params.has_key?(:members))
      @user = User.find(params[:members])
    end
	  @group.owner_id = current_user["id"]
    if @group.save
      unless @user.nil?
        @user.each do |u|
          @membership = Membership.new(:group_id => @group.id, :user_id => u.id )  
          if @membership.save
          else
            flash[:error]="A user wasn't added to group"
          end
        end
      end
      flash[:success] = "Group created!"
      redirect_to current_user
    else
      flash[:error] = "Group wasn't created"
      redirect_to current_user
    end
  end
  
  def edit
    @group = Group.find(params[:id])
    @members = @group.users
    @nonmembers = User.all - @members
    @nonmembers.delete(@group.owner)
  end
  def update
    @group = Group.find(params[:id])
    @members = @group.users
    @nonmembers = User.all - @members
    @nonmembers.delete(@group.owner)
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to current_user
    else
      render 'edit'
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
      @group = current_user.owned_groups.find_by(:id => params[:id])
      redirect_to root_url if @group.nil?
    end
end