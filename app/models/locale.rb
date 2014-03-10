class Locale < ActiveRecord::Base

  self.table_name = 'CountriesRegions'
  alias_attribute :country_id, 'CountryID'
  alias_attribute :region_id, 'RegionID'
  belongs_to :country, foreign_key: "CountryID" 
  belongs_to :region, foreign_key: "RegionID" 

end
