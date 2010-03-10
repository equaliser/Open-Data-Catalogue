class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.integer :author
      t.datetime :date
      t.text :content
      t.string :status, :limit =>30
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
