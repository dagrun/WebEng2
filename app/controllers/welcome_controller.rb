class WelcomeController < ApplicationController
	def index
    if signed_in?
      @group  = current_user.groups.build
      if @group.nil?
        @group = Group.new
      end
    end
  end
end
