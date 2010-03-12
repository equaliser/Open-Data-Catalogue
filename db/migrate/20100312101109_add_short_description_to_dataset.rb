class AddShortDescriptionToDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :short_description, :string
  end

  def self.down
    remove_column :datasets, :short_description
  end
end
