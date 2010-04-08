class CreateTemporalGranularities < ActiveRecord::Migration
  def self.up
    create_table :temporal_granularities do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :temporal_granularities
  end
end
