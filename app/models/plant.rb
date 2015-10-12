class Plant < ActiveRecord::Base
  has_many :greeneries
  has_many :users, through: :greeneries
end
