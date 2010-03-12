class AddCachedSlugDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :cached_slug, :string
  end

  def self.down
    remove_column :datasets, :cached_slug
  end
end
