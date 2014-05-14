class WelcomeController < ApplicationController
	def index
    if signed_in?
      @groups = current_user.groups
      if @group.nil?
        @group = Group.new
      end
    end
  end
end
