class Group < ActiveRecord::Base
	has_many :users
	validates :topic, length: {minimum: 3, maximum: 50}
	validates :home_town, length: {minimum: 3, maximum: 70}
end
