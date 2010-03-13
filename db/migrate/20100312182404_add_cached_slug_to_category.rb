class AddCachedSlugToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :cached_slug, :string
  end

  def self.down
    remove_column :categories, :cached_slug
  end
end
