class RemoveOldUrlsFromDataset < ActiveRecord::Migration
  def self.up
    remove_column :datasets, :xml_url
    remove_column :datasets, :csv_url
  end

  def self.down
    add_column :datasets, :csv_url, :string
    add_column :datasets, :xml_url, :string
  end
end
