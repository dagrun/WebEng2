class Vote < ActiveRecord::Base
  has_many  :users
  belongs_to :activity
end
