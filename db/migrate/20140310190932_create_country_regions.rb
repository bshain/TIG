class CreateCountryRegions < ActiveRecord::Migration
  def change
    create_table :country_regions do |t|

      t.timestamps
    end
  end
end
