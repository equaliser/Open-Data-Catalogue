class CreateBlogposts < ActiveRecord::Migration
  def self.up
    create_table :blogposts do |t|
      t.string :author
      t.string :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :blogposts
  end
end
