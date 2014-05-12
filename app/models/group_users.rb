class GroupUsers < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  
  after_save :enforce_single_owner

  def enforce_single_owner
    if self.changes["owner"] && self.owner
      GroupUser.find(:all, :conditions => ["group_id = ? and id <> ? and owner = ?", self.group_id, self.id, true]).each{|gu| gu.update_attributes(:owner => false)
    end
  end
  
end
