class Plant < ActiveRecord::Base
  has_many :greeneries
  has_many :plants, through: :greeneries
end
