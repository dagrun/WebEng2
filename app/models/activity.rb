class Activity < ActiveRecord::Base
  belongs_to :group
  has_many :votes, dependent: :destroy
end
