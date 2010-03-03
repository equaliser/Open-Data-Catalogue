class BlogPostContent < ActiveRecord::Migration
  def self.up
    add_column :blogposts, :synopsis, :text
    add_column :blogposts, :content, :text
    add_column :blogposts, :published, :boolean
    add_column :blogposts, :publishdate, :datetime
  end

  def self.down
    remove_column :blogposts, :synopsis
    remove_column :blogposts, :content
    remove_column :blogposts, :published
    remove_column :blogposts, :publishdate
  end
end
