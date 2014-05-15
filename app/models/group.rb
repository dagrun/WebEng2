class Group < ActiveRecord::Base
	belongs_to :owner, {class_name: "User"}
  has_many :memberships, {dependent: :destroy}
  has_many :users, through: :memberships
  default_scope -> { order('created_at DESC') }
  validates :owner_id, presence: true
	validates :topic, length: {minimum: 3, maximum: 50}
	validates :home_town, length: {minimum: 3, maximum: 70}
end
