class Country < ActiveRecord::Base

  self.primary_key = "CountryID"
  has_many :locales, foreign_key: "CountryID"
  has_many :regions, through: :locales

  has_many :users, foreign_key: "CountryID"

end
