class AddPublishStatusToDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :status, :string, :limit =>30
  end

  def self.down
    remove_column :datasets, :status
  end
end
