class CreateGeoGranularities < ActiveRecord::Migration
  def self.up
    create_table :geo_granularities do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_granularities
  end
end
