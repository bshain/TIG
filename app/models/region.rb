class Region < ActiveRecord::Base

  self.primary_key="RegionID"
  has_many :locales, foreign_key: "RegionID"
  has_many :countries, through: :locales

end
