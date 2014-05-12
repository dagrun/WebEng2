class Group < ActiveRecord::Base
	#has_many :members, class_name: 'User'
	#belongs_to :owner, class_name: 'User'
	has_many :group_users, :dependent => :destroy
	has_many :groups, :through => group_user
	validates :topic, length: {minimum: 3, maximum: 50}
	validates :home_town, length: {minimum: 3, maximum: 70}
	
  def owner
    self.users.find(:first, :conditions => ["group_users.owner = ?", true])
  end

  def owner=(user)
    if gu = self.group_users.find_by_user_id(user.id)
      gu.update_attributes(:owner => true)
    else
      self.group_users.create(:user_id => user, :owner => true)
    end
  end
	
end
